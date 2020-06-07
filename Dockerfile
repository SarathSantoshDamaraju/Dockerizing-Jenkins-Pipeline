# Setup Ubuntu latest
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

#just info about who created this
MAINTAINER Krishna Damaraju

#this is the base image we use to create our image from
FROM jenkins/jenkins:lts
