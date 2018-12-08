Bee Swarm Style Plots
=====================

Bee swarm plots are a form of scatter plot that aim to avoid the usual
overlay of points that occur with scatterplots. This is the scenario
where the dataset contains multiple observations of the same data points
and plotting them on a two dimensional plot simply overlays the points.
With beeswarm plots the points are jittered whilst retaining some
semblance of density.

The [ggbeeswarm package](https://github.com/eclarke/ggbeeswarm) for R
based on [ggplot](https://ggplot2.org) was written by Erik Clarke and
Scott Sherrill-Mix and this [MLHub](https://mlhub.ai) demonstration is
based on their [README](https://github.com/eclarke/ggbeeswarm).

Visit the github repository for more details:
<https://github.com/gjwgit/beeswarm>

Usage
-----

To install and run the pre-built model:

    $ pip3 install mlhub
    $ ml install   beeswarm
    $ ml configure beeswarm
    $ ml demo      beeswarm
    $ ml print     beeswarm
    $ ml display   beeswarm
