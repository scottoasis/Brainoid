Brainoid
========

## Abstract

Brainoid is an framework to help you analyze
[EEG](http://en.wikipedia.org/wiki/Eeg) data. It was originaly build
for the use of Brain-Computer Interface
([BCI])(http://en.wikipedia.org/wiki/Brain-computer_interface), but we
believe that it is also applicable to other bio-sig data, like
[EMG](http://en.wikipedia.org/wiki/Electromyography), or even with
other patter-recognition or classification problems.  It is developed
with `Matlab`, which we believe is easy to understand for most of
researchers in these fields.


## Objectives

The major objective of Brainoid is to bring you a unified and flexible
set of softwares to make it easier to build a BCI system, either
online or offline. We decided to achive this goal by modularization,
which means every part of signal processing, for example
preprocessing, modeling and postprocessing. Each part, aka. module,
can be seperated into several smaller parts, called sub-modules, like
normalization, or windsorking in preprocessing.

We decided to provide Brainoid as a framework. In other words, you can
repalca those pre-defined modules to achive your specification. By
introducing the concept of modules, you can write codes that is
reusable and more readable, which you will benefit from on the long
run.

Another tool we introduced is Test-Driven Development (TDD). The
concept is write tests, then try to write codes to pass these
tests. TDD will help you write maintainable modules.


Up and running
--------------

### Adding third-party libraries

It is quite commen that recorded BCI data need third-party libs to
resolve the raw data. What's more, you may want to reuse codes from
others such as algorithm packages. It is recommanded to add these
packages under the lib/ directory, thus Brianoid can look up for it
automatically.


### Let me know where to find you




### Defining your data structure

Raw data used in BCI is usually composed with extremly complexity,
with numerous tags and synchronized labels. Usually you can seperate
raw-data into three parts: headers, pure-data and others. headers are
data about the data it recorded, such as sample rate, definition of
electrodes or the name of subject. These information are extremly
helpful for you and Brainoid to understand the data.


### Give it a shot


### Organize your own workfolw


About licensing
---------------

This software is under GNU Public License (GPL). You should have
received a copy of the GPL license along with the software. If not,
write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth
Floor, Boston, MA 02110-1301, USA.


## Help us


