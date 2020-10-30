from django.shortcuts import render
from .lda.lda import LDA
import os
import numpy as np

def home(request):
    return render(request,'simplelda/home.html')

def simple(request,one=None,two=None):
    l = LDA()
    res,theta = l.solve(7, 1.5, 1, 10)
    print('doc1' in request.POST)
    if request.method == 'POST' and 'doc1' in request.POST:
        docid1 = request.POST['doc1']
        docid2 = request.POST['doc2']
        doc_one = theta[int(docid1)]
        doc_two = theta[int(docid2)]
        print(doc_one)
        print(doc_two)
        similarity = 0
        for i in range(0,len(doc_one)):
            similarity += abs(doc_one[i]-doc_two[i])
        similarity = 1/similarity
        return render(request, 'simplelda/simple.html',{'res': res,'sim':similarity,'one':docid1,'two':docid2})
    else:
        return render(request, 'simplelda/simple.html',{'res': res})
