--- 
layout: post
title: Challenges in Beacon
date: June 20, 2017
author: Yi DING
---

[comment]: # (This blog compose the CHALLENGES section of \(mutiple\) future paper)

Here we discuss some challenges met in real world beacon applications.

1. Beacon Security
2. Inaccurate Indoor Position Information
3. Unknow Beacon Recognition
4. Power Consumption

## Beacon Security
Since iBeacon protocol is designed for broadcasting the position informaton for LBS application. The contents broadcasted can be detected and recognized by any BLE device. This is beneficial in the sense that beacon hardware deployed by one company can be utilized by another company. But this also causes security issues that the beacon information (UUID, Major, Minor) can be faked to cheat the APP. This "bug" might be utilized by the competitor company or other characters for malicious purpose. 

Soluiton: 
(1) Currently estimote provides service named "Secure Beacon" for their own products. The basic idea is to rotate the UUID, Major and Minor so that the contents broadcasted are unpredictable. But the detailed technologies are kept as patent.
(2) Some other security mechanism provided by Ling Liu.

## Inaccurate Indoor Position Information
Localization based on GPS is utilized in many existing application, but will come across problems in indoor environment. Indoor localization based on beacons have been studied in many [studies](https://dymodi.github.io/Research/Beacon-Localization-Related-Works). However, the output of existing indoor localization system is not in GPS format (latitude, longitude) hence cannot be utilized by existing applications directly. If we know the accurate position information of each beacon, we can transfer the result of current indoor localization system to GPS format. The problem is, in current map sevice (Google Map, Baidu Map, Gaode Map), they can only provide building level GPS information. 
Although we can get very accurate localization results based on beacon, the accuracy of the transferred GPS information also depends on the accurate of beacon position information. That is, if we don't have very accurate anchor inforamtion, the result will be inaccurate.
The specific GPS information for small shops within the building is usually not accurate. 
(Here we need have some figures to show the inaccuracy of shops within different Map services)
If we map the beacon to the shops locations provided by the above Map, the localization and trace will be wrong. For some small-scale application such as a small building with less than 10 beacons, we can manuelly measure and correct the position of the beacons to get accurate beacon location information. However, for large-scale application, manuelly correction will be impossible.

Solution:
(1) Cross validation based on device sensing data. (We need to check if there are existing papers on this topic)

## Unknow Beacon Recognition

## Power Consumption
The system needs to be optimized for energy, to avoid a significant battery drain during localization.
