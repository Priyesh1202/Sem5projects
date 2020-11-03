from django.shortcuts import render
from .lda.lda import LDA
import json
import os
import numpy as np

def home(request):
    return render(request,'simplelda/home.html')

def about(request):
    return render(request,'simplelda/aboutus.html')

def simple(request,one=None,two=None):
    l = LDA()
    res,theta = l.solve(7, 1.5, 1, 10)
    print('doc1' in request.POST)
    if request.method == 'POST' and 'doc1' in request.POST:
        docid1 = request.POST['doc1']
        docid2 = request.POST['doc2']
        doc_one = theta[int(docid1)]
        doc_two = theta[int(docid2)]
        with open('json/data.json', 'r') as fp:
            data = json.load(fp)
        print(doc_one)
        print(doc_two)
        similarity = 0
        for i in range(0,len(doc_one)):
            similarity += abs(doc_one[i]-doc_two[i])
        similarity = 1/similarity
        return render(request, 'simplelda/simple.html',{'res': res,'sim':similarity,'one':data[int(docid1)-1],'two':data[int(docid2)-1],'id1':docid1,'id2':docid2})
    else:
        return render(request, 'simplelda/simple.html',{'res': res})

def der(request):
    return render(request, 'simplelda/derivation.html')