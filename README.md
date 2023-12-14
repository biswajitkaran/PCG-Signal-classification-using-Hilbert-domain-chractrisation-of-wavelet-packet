# PCG-Signal-classification-using-Hilbert-domain-characterisation-of-wavelet-packet
The script will work for Matlab2019 and  onwards version.
Change the number of classes 5 or 10 in the code ECOC_svm_knn.m as per the requirment based on the database used.
Folder consists of code of all set of features extraction.
Folder consist of classification code  with proposed features set. 
The proposed features set are extracted and save as csv file. 
Columns 1-32 is the WCC features set and columns 33 consist the label.
If your are using the code please cite the article
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@article{KARAN2024105793,
title = {Hilbert domain characterizations of wavelet packets for automated heart sound abnormality detection},
journal = {Biomedical Signal Processing and Control},
volume = {90},
pages = {105793},
year = {2024},
issn = {1746-8094},
doi = {https://doi.org/10.1016/j.bspc.2023.105793},
url = {https://www.sciencedirect.com/science/article/pii/S1746809423012260},
author = {Biswajit Karan and Trideba Padhi},
keywords = {ECOC, Hilbert transformation, PCG, k-NN, SVM, Wavelet packet},
abstract = {Heart valve disease (HVD) is a common disease that affects millions of people worldwide. Early detection and treatment are essential for improving the prognosis of patients with HVD. Phonocardiogram (PCG) signals are a non-invasive and inexpensive way to assess the mechanical activity of the heart. In this study, a novel method for HVD detection using Hilbert domain mapping of wavelet packet of PCG signals is proposed. Two standard PCG databases are used to evaluate the proposed method. Packet instantaneous frequency deviation (PIFD) and packet instantaneous energy deviation (PIED) features are extracted from the PCG signals and used for classification. A support vector machine (SVM) and K-nearest neighbour (KNN) based error-correcting output code (ECOC) approach is used to handle multiclass classification and minimize classification error. The proposed method achieves an unweighted average recall (UAR) of 99.8% on database 1 and 99.32% on database 2, which outperforms other baseline methods. The results suggest that the proposed method is a promising approach for HVD detection using PCG signals.}
...........................................................................................................................................................................................................................................
