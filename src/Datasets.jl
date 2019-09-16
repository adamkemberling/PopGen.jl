## test data available for use in PopGen

"""
    nancycats()
Returns a `PopObj` of corresponding "nancycats" dataset as featured in
the R package `adegenet`. This is microsatellite data of 9 loci in 237
individuals across 17 populations.

Example:

`nancy = nancycats()`
"""
function nancycats()
    filename = normpath(joinpath(@__DIR__,"..","data", "data", "nancycats.csv"))
    return csv(filename, location = false)
end


"""
    gulfsharks()
Returns a `PopObj` corresponding the Blacknose shark dataset as used in
Dimens et al. 2019. This is a mid-sized SNP dataset of 2213 SNPs in 212
individuals, across 7 populations.

Example:

`sharks = gulfsharks()`
"""
function gulfsharks()
    filename = normpath(joinpath(@__DIR__,"..","data", "data", "gulfsharks.gen"))
<<<<<<< HEAD
    xloc = [-80.59928
=======
    yloc = [-80.59928
>>>>>>> master
            -80.59954
            -80.59958
            -80.42248
            -80.35779
            -80.35786
            -80.34815
            -80.34822
            -80.43027
            -80.24937
            -80.24964
            -80.24959
            -80.24976
            -80.24954
            -80.24944
            -80.49627
            -80.49682
            -80.4967
            -80.49664
            -80.49605
            -80.10169
            -81.30037
            -81.3217
            -81.42224
            -81.29336
            -81.29336
            -81.38756
            -81.38756
            -81.39475
            -81.36869
            -81.36879
            -81.4027
            -81.20213
            -81.39859
            -81.39798
            -81.15039
            -81.37432
            -81.38336
            -81.34095
            -81.34075
            -81.34147
            -81.34094
            -81.34122
            -81.3417
            -81.33707
            -81.43061
            -81.20041
            -81.43111
            -81.43081
            -81.43102
            -81.25828
            -79.81894
            -79.79036
            -79.79086
            -80.35753
            -80.35754
            -80.35783
            -80.35765
            -80.35712
            -80.35712
            -80.35799
            -80.357
            -80.44488
            -80.44511
            -79.81454
            -79.82027
            -79.80382
            -79.8041
            -79.80383
            -79.80408
            -79.80471
            -79.80422
            -79.80381
            -79.80425
            -79.80451
            -79.80383
            -79.80434
            -80.70928
            -79.84989
            -81.56379
            -81.56447
            -81.42769
            -81.41631
            -81.16435
            -81.16054
            -81.09332
            -80.73249
            -80.93939
            -80.76868
            -80.76853
            -80.74511
            -80.74504
            -80.80831
            -81.78288
            -81.78309
            -81.80621
            -81.80677
            -81.81822
            -81.81819
            -81.76506
            -81.75001
            -81.74955
            -81.7501
            -81.73252
            -81.72459
            -81.86906
            -82.07268
            -82.07234
            -82.07196
            -82.07248
            -82.07196
            -82.07217
            -82.07264
            -82.08975
            -82.05538
            -82.08971
            -82.0546
            -82.05489
            -82.0748
            -82.07446
            -82.07476
            -82.09188
            -82.09226
            -82.09236
            -82.0916
            -82.09153
            -82.09168
            -82.09171
            -82.09156
            -80.9965
            -81.04498
            -81.00124
            -81.00353
            -80.99296
            -81.00691
            -80.99782
            -81.00029
            -80.99829
            -80.99768
            -81.00383
            -81.00061
            -80.99762
            -81.75011
            -81.03748
            -82.84887
            -83.60492
            -82.72491
            -82.72514
            -82.72485
            -82.72501
            -82.61679
            -82.61668
            -82.56186
            -83.08778
            -82.49909
            -82.74918
            -82.7396
            -82.80298
            -82.66804
            -82.66804
            -82.73849
            -82.74948
            -82.74963
            -82.66823
            -82.80976
            -82.80976
            -82.74893
            -82.80714
            -82.74321
            -82.79686
            -82.77452
            -82.8552
            -82.79715
            -84.72682
            -84.13857
            -84.13877
            -84.13855
            -83.42212
            -84.49099
            -84.45066
            -84.44933
            -84.48637
            -84.48524
            -85.15517
            -85.15494
            -84.48488
            -84.50144
            -84.50057
            -84.47698
            -84.48949
            -84.50102
            -85.23794
            -87.71888
            -88.00071
            -88.04933
            -88.04904
            -88.16747
            -88.05461
            -88.2974
            -88.35997
            -88.39216
            -88.16801
            -86.03987
            -85.64937
            -87.44028
            -86.53741
            -86.53756
            -86.09053
            -87.36605
            -87.36617
            -85.71432
            -85.71432
            ]
<<<<<<< HEAD
    yloc = [28.30624
=======
    xloc = [28.30624
>>>>>>> master
            28.30787
            28.30234
            28.61234
            27.86661
            27.86659
            27.86821
            27.8711
            28.48153
            28.24211
            28.24276
            28.2378
            28.24141
            28.23596
            28.23644
            28.39057
            28.39016
            28.38607
            28.38686
            28.38649
            27.57661
            31.16833
            31.15513
            30.82858
            30.78698
            30.78698
            30.83904
            30.83904
            30.84482
            30.96765
            30.96915
            30.84907
            31.11922
            30.85875
            30.86431
            31.3305
            30.95857
            30.40459
            31.01552
            31.01451
            31.0157
            31.01682
            31.01409
            31.01971
            31.00965
            30.58793
            31.09504
            30.58181
            30.58476
            30.59014
            31.22919
            32.72165
            32.66413
            32.66126
            32.44526
            32.45119
            32.45071
            32.44581
            32.4508
            32.45339
            32.44588
            32.45174
            32.45064
            32.45696
            32.73458
            32.73266
            32.72372
            32.73138
            32.72676
            32.73036
            32.7323
            32.72279
            32.7283
            32.72665
            32.72764
            32.73162
            32.72347
            32.31162
            32.73778
            24.76982
            24.77288
            24.79486
            24.82328
            24.59827
            24.60102
            24.61792
            24.75817
            24.71942
            24.83066
            24.83652
            24.84129
            24.83924
            24.80488
            24.45817
            24.45688
            24.46559
            24.46232
            24.44635
            24.44414
            24.45884
            24.46137
            24.46082
            24.45485
            24.47263
            24.45921
            24.44529
            24.43813
            24.44609
            24.44349
            24.44051
            24.44121
            24.44217
            24.44578
            24.44059
            24.4335
            24.44744
            24.43314
            24.43995
            24.44429
            24.43938
            24.44675
            24.44683
            24.45088
            24.45091
            24.44666
            24.44509
            24.44284
            24.44985
            24.44255
            25.0083
            25.10191
            25.01428
            25.01907
            25.01096
            25.01279
            25.00765
            25.01504
            25.01565
            25.01249
            25.01759
            25.02244
            25.00738
            24.4617
            25.10086
            27.45678
            27.35171
            26.24867
            26.2486
            26.25634
            26.25514
            25.4607
            25.45863
            25.92942
            25.51734
            25.13769
            24.83092
            24.92929
            24.92038
            24.66909
            24.67271
            24.88658
            24.82947
            24.82769
            24.66979
            28.33518
            28.33691
            28.34884
            28.32341
            28.44358
            28.77552
            28.31135
            28.40218
            28.77383
            28.61922
            29.9992
            29.99503
            29.99472
            29.60836
            29.88518
            29.85259
            29.86432
            29.84045
            29.8507
            29.50347
            29.51108
            29.85473
            29.83699
            29.82836
            29.88213
            29.83377
            29.83382
            29.04839
            29.89008
            30.19427
            30.00212
            30.00689
            29.8362
            29.50566
            30.14284
            30.20737
            30.11506
            29.8362
            29.94663
            29.99695
            29.6966
            30.06404
            30.0696
            29.90653
            30.05317
            30.05217
            29.82344
            29.82344
            ]
    x = genepop(filename, numpops = 7)
<<<<<<< HEAD
    x.samples.latitude = yloc ; x.samples.longitude = xloc
=======
    x.latitude = xloc ; x.longitude = yloc
>>>>>>> master
    return x
end