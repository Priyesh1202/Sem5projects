import numpy as np
from numpy import genfromtxt
import os.path
import random
from sklearn.datasets import fetch_20newsgroups
from sklearn.feature_extraction.text import CountVectorizer
import json

class LDA:

    def __init__(self):
        self.data = None
        self.vocabulary = None
        self.docs = []
        self.D = None
        self.T = None
        self.V = None
        self.alpha = None
        self.beta = None
        self.iters = None
        self.z_d_n = None
        self.theta_d_z = None
        self.phi_z_w = None
        self.n_d = None
        self.n_z = None


        

    def getData(self):
        if os.path.exists("json/data.json"):
            print("Here")
            with open('json/data.json', 'r') as fp:
                self.data = json.load(fp)
        else:
            data, _ = fetch_20newsgroups(shuffle=True, random_state=1, remove=('headers', 'footers', 'quotes'),return_X_y=True)
            self.data = data
            with open('json/data.json', 'w') as fp:
                json.dump(data, fp, indent=4)

    def getVocab(self):
        if os.path.exists("json/docs.json") and os.path.exists("json/vocab.json"):
            with open('json/docs.json', 'r') as fp:
                self.docs = json.load(fp)
            with open('json/vocab.json', 'r') as f:
                self.vocabulary = json.load(f)
        else:
            tf_vectorizer = CountVectorizer(max_df=0.95, min_df=2,
                                            stop_words='english')
            tf = tf_vectorizer.fit_transform(self.data)
            self.vocabulary = tf_vectorizer.vocabulary_
            for row in tf.toarray():
                present_words = np.where(row != 0)[0].tolist()
                present_words_with_count = []
                for word_idx in present_words:
                    for count in range(row[word_idx]):
                        present_words_with_count.append(word_idx)
                self.docs.append(present_words_with_count)
            with open('json/docs.json', 'w') as fp:
                json.dump(self.docs, fp, indent=4)
            with open('json/vocab.json', 'w') as f:
                json.dump(self.vocabulary, f, indent=4)

    def params(self, T, alpha, beta, iters):
        self.D = len(self.docs)
        self.V = len(self.vocabulary)
        self.T = T
        self.alpha = alpha
        self.beta = beta
        self.iters = iters

    def solver(self):
        z_d_n = [[0 for _ in range(len(d))] for d in self.docs]
        theta_d_z = np.zeros((self.D, self.T))
        phi_z_w = np.zeros((self.T, self.V))
        n_d = np.zeros((self.D))
        n_z = np.zeros((self.T))

        for d, doc in enumerate(self.docs):

            for n, w in enumerate(doc):
                z_d_n[d][n] = n % self.T
                z = z_d_n[d][n]
                theta_d_z[d][z] += 1
                phi_z_w[z, w] += 1
                n_z[z] += 1
                n_d[d] += 1

        for iteration in range(self.iters):
            print(iteration)
            for d, doc in enumerate(self.docs):
                for n, w in enumerate(doc):
                    z = z_d_n[d][n]

                    # decrement counts for word w with associated topic z
                    theta_d_z[d][z] -= 1
                    phi_z_w[z, w] -= 1
                    n_z[z] -= 1

                    # sample new topic from a multinomial according to our formular
                    p_d_t = (theta_d_z[d] + self.alpha) / (n_d[d] - 1 + self.T * self.alpha)
                    p_t_w = (phi_z_w[:, w] + self.beta) / (n_z + self.V * self.beta)
                    p_z = p_d_t * p_t_w
                    p_z /= np.sum(p_z)
                    new_z = np.random.multinomial(1, p_z).argmax()

                    # set z as the new topic and increment counts
                    z_d_n[d][n] = new_z
                    theta_d_z[d][new_z] += 1
                    phi_z_w[new_z, w] += 1
                    n_z[new_z] += 1
        self.z_d_n = z_d_n
        self.theta_d_z = theta_d_z
        self.phi_z_w = phi_z_w
        self.n_d = n_d
        self.n_z = n_z
        np.savetxt("phi.csv", self.phi_z_w, delimiter=',')
        np.savetxt("theta.csv", self.theta_d_z, delimiter=',')


    def displayResults(self):
        messages = []
        if os.path.exists("simplelda/lda/phi.csv"):
            self.phi_z_w = genfromtxt("simplelda/lda/phi.csv", delimiter=',')
            self.theta_d_z = genfromtxt("simplelda/lda/theta.csv", delimiter=',')
        inv_vocabulary = {v: k for k, v in self.vocabulary.items()}
        n_top_words = 20
        for topic_idx, topic in enumerate(self.phi_z_w):
            message = "Topic #%d: " % topic_idx
            message += " ".join([inv_vocabulary[i]
                                for i in topic.argsort()[:-n_top_words - 1:-1]])
            messages.append(str(message))
        return messages


    def solve(self, T, alpha, beta, iters):
        if os.path.exists("simplelda/lda/phi.csv"):

            self.getData()
            print("Got data")
            self.getVocab()
            print("Got Vocab")
            self.params(T, alpha, beta, iters)
            res = self.displayResults()
            print(self.theta_d_z[12])
            # print(self.theta_d_z[0])
            # print(self.theta_d_z[1])
            return res,self.theta_d_z
        self.getData()
        self.getVocab()
        self.solver()
        res = self.displayResults()
        return res,self.theta_d_z
        

# lda = LDA()
# lda.solve(7,1.5,1,10)
    
        
