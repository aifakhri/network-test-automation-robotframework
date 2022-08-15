# Test Automation with Robotframework

## Introduction

This is a simulated Network Testing Automation framework. The use case here is based on a virtual Arista vEOS in a virtual CLOS topology. Please [find here to build the use case](https://medium.com/@zeitdeuter/bgp-evpn-and-vxlan-configuration-with-arista-veos-b1046c24d046) network topology.

## How To Use
if you have built the virtual use case above. You could run this test through the ``program_runner.py`` files. Here are the option available:

* Running Tests Cases for All devices in The Network
```console
python program_runner.py
```
* Running Tests Only for Leaf or Spine Switces in The Network
```console
python program_runner.py -d leaf 
```
```console
python program_runner.py -d leaf 
```
*Running Tests for One Device
```console
python program_runner.py -d veosleaf01
```
For the other individual device name you could check with ``python program_runner.py -h ``