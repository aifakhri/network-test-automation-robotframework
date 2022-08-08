# Test Automation with Robotframework

## Introduction

This is a simulated Network Testing Automation framework. The use case here is based on a virtual Arista vEOS in a virtual CLOS topology. Please [find here to build the use case](https://medium.com/@zeitdeuter/bgp-evpn-and-vxlan-configuration-with-arista-veos-b1046c24d046) network topology.

## How To Use
if you have built the virtual use case above. You could run this test by running this command:

```console
robot -v DEVICE:{{device_name}} Tests\{{test_case_file_name}}
```

the device_name is the filename (without extension) of the file, whils the test_case_file_name is the robot file in the Tests folder. Here is the example:
```console
robot -v DEVICE:veosLeaf01 Tests\test_vxlan_irb.robot
```