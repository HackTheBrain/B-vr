This is the project B-vr[biːvə(r)] - a short for Brain VR. Project B-vr is an abstract audiovisual art form with a goal to create a cerebral virtual reality visual music instrument. And a lots of pyramids.

# Overview
B-vr is a visual scene portable to VR which is driven by the eeg signal provided by the EMOTIVE eeg. We use its gyroscope to drive the view on flat screens projections. 

The scenes visuals and sounds are matched to alfa, beta and theta power as well as trained parameters from the OpenViBE . Result is an abstract audiovisual experience which you can shape to your liking with your mind only!

# What you need to get it to work
Working version of Unity, OpenVibe installed and working. In case of using the emotive eeg, you need to have the Emotive research SDK to be able to sniff raw EEG from the headset. Project B-vr should theoretically work with other devices, but this was untested. In case you are not using the Emotive, you need to setup your own version of channel selection and acquisition server in the OpenVibe, but the Unity part is headset independent. 

## Unity 
1. You need to download and start the Unity project here
2. You need to configure the brv_listener port in the intro scene.

## OpenViBE 
1. Then you need to download and configure OpenViBE  setpu files as here
2. Modify it to your liking.

## Conecting
1. In OpenViBE setup OSC senders to the IP address of the Unity runnign device.
2. In case you are creating new features, you need to add appropriate events and such in the unity EegOscReceiver class.
3. If you modified some features, you have to bind appropriate events in the Unity brv_listener class.


# Setup
Emotive is connected wirelessly and setup using EMOC software. Data is recorded and processed with OpenViBE. Using of OpenViBE allows us to train various characteristics of the signal using machine learning and to do preprocessing on the data beore passing it on. Preprocessed data  from Open vibe are packed in OSC packets and sent through UDP protocol over wifi to a target listening device. We coded custom .NET dll which listens to thic sommunication and binds its events to methods in Unity. Unity is interpreting these EEG features and decoding gyroscopic data to control camera movement and various parameters to modify visuals and audio in the scene.

Image of the setup[]()

# EEG features

# Project parts
Unity side of Project can be found here

The OSC c# listener can be found here

Open Vibe setups are here:

# Why?

# EEG issues
The emotive device, despite looking cool, is not easy to use. The provided SDKs have tendencies to malfunction, electrodes not picking up signals and debugging in such short time and without acces to the proprietary firmware is challenging. We were lucky to obtain one of the devices that actually worked and was sending data to the receiver, but the community sdks for c# or unity proved to be unstable.

THe open Vibe connection Was working quite well, although it was no easy to get the training part working.

# Emotive issues
There were some large issues in getting emotive to work. First we realsied that the wifi antenna that was close to the emotive receiver was ruining the signal. So if you have trouble with reception, try to move the receiver further away from potential strong radio sources.

Secondly, ....

#
=======
# B-vr 

## WHO:
* Štěpán Drbohlav
* Lukáš Hejtmánek
* Martin Hofmann
* Lucia Hrašková
* Evan Tedlock
* Lukáš Ulrich

alpha - arousal/relaxation
frontal alpha asymmetry - approach/avoidance

## WHY 

Because why not?

## References

## Ethical considerations
*please share the insights about ethical matters surrounding your work. Some "ethical cards" have been distributed to support the discussion about this subject.*

