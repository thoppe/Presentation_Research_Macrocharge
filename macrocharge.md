# Virial
## Coefficients
#### of Charged Protein Solutions

----------

NIH, NIDDK, LBG
*[Travis Hoppe](http://thoppe.github.io/)*, Allen Minton, Di Wu
[(deck source)](https://github.com/thoppe/research_pres_macrocharge)

====

# Main Idea
Predict $B_{2}$ from structural information

against

## <span class=lowercase>p</span>H Dependence
## Concentration
## Charge anisotropy
====*

### intra-protein interactions
!(images/1AO6_cartoon.png) <<height:225px;transparent>> 
!(images/1OVA_cartoon.png) <<height:225px;transparent>> 
!(images/1W6Z_cartoon.png) <<height:225px;transparent>> 
!(images/3V03_cartoon.png) <<height:225px;transparent>>
Human serum albumin, Ovalbumin, Lysozyme, Bovine Serum Albumin respectively.

How do we model the interaction between proteins on a larger scale? Can we *predict* aggregates?

====*

# Mixtures

Phase separations lead to sudden fundamental changes in liquid structure and local density.

!(images/example_phase_sep.jpg)
!(images/phase_sep2.jpg)

This is usually really important.

====*

# Basic Science


*Match* experimental data with results 
of computational models.

*Classify* common protein solution behavior 
from coarse-grained models.

*Predict* behavior of mutations and unknown solutions.

====

### Virial Coefficients
An equation of state expanded in powers of density $\rho$
# $\frac{P}{k_B T} = \rho + B_2(T) \rho^2 + B_3(T) \rho^3 + \ldots$
$B_2$ is the pairwise interaction of _two_ molecules
$B_3$ is the pairwise interaction of _three_ molecules
...
====+
From the equation of state you can calculate many thermodynamic properties.

Necessary first step for a verifiable model.

====*
## Virial Coefficients

For rotationally invariant molecules
#$B_2 = -\frac{1}{2} \int_0^\infty (e^{-U(r)/k_B T} - 1) 4\pi r^2 dr$
(where $U$ is the pairwise interaction energy)

but in general...
#$B_2 = -\frac{1}{2|\Omega|^2} \int_0^\infty \int_{\Omega_1} \int_{\Omega_2} (e^{-U(r,\omega_1,\omega_2)/k_B T} - 1) r^2 d \omega_1 d \omega_2 dr$

====*

## Virial Coefficients
Why work with this expansion?
====+
Experimental measurements (light scattering) possible.
!(images/exp_B22_1OVA.png) <<height:450px>>

====
How do you model a
## protein?


Need an expression for the interaction energy $U$
This is not the free energy, but the *enthalpy*

Important terms:
+ Volume exclusion
+ Electrostatics
+ Non-specific interactions (London/dispersion forces)

====*
How do you model a
## protein?

Second-order effects?

+ Non spherical geometries
+ Polarization
+ Internal conformational energies
+ Solvent effects


Must decide if this approximation is valid for the system.
====

modeling the 
## Excluded Volume
_(it's easy!)_

====

## Hard spheres
overlap energy is either $0$ or $\infty$

|## $B_2 = -\frac{1}{2} \int_0^\sigma  (e^{-\infty/k_B T} - 1) 4\pi r^2 dr + -\frac{1}{2} \int_\sigma^\infty (e^{0/k_B T} - 1) 4\pi r^2 dr$

|## $B_2 = -\frac{1}{2} \int_0^\sigma (-1) 4\pi r^2 dr - \frac{1}{2} \int_\sigma^\infty (0) 4\pi r^2 dr $

|## $B_2 = \frac{2}{3} \pi \sigma^3 $

====*

modeling the 
## Electrostatics
_(not so easy)_

====

## Electrostatic field

Coulomb's Law (point charge)
## $\phi = \frac{1}{4 \pi \epsilon_0}\frac{q}{r}$

Correction for dielectrics?
## $\phi = \frac{1}{4 \pi \epsilon_0 \epsilon_r }\frac{q}{r}$

### What about the solvent?
====*

## Yukawa Potential

# $\phi = \frac{1}{4 \pi \epsilon_0 \epsilon_r }\frac{q}{r} e^{-\kappa r}$

First order approximation to *screening* effects.
Charge strength *decays exponentially* due to ions.

====*

## Poisson Boltzmann

# $\vec{\nabla}\cdot\left[\epsilon(\vec{r})\vec{\nabla}\phi(\vec{r})\right] = -\rho^{f}(\vec{r}) - \sum_{i}c_{i}^{\infty}z_{i} q \lambda(\vec{r}) \exp \left[{\frac{-z_{i}q\phi(\vec{r})}{k_B T}}\right]$

Describes the electrostatic interaction between a charge distribution and an *ionic* solution.

Can be *linearized* and solved on a computer efficiently.

Splits space into regions of discrete $\epsilon_r$.

====

# The Process
!(images/human_serum_albumin_1e7h.png) <<transparent>>

Start with the crystallized PDB Structure (HSA)
====*

## Adaptive Poisson-Boltzmann Solver
!(images/human_serum_albumin_1e7h_ALPHA.png) <<transparent>>

Typically (in the absence of ions) 
$\epsilon_{\text{water}} = 80$, $\epsilon_{\text{protein}} = 4$

====*

# The Process
!(images/human_serum_albumin_1e7h_pH_4.01886800_field.png)

Electrostatic field

====*
# The Process
!(images/HSA_1E7H_spheres.png) <<transparent>>

Determine a region of excluded volume.
====*

# The Process
!(images/superposition_SPH.png) <<transparent>>

Spherical Harmonic decomposition for large distances.

====*
# The Process

!(images/HSA_real.png) <<transparent>>
!(images/HSA_fit.png)  <<transparent>>

Best fit macrocharges to replicate the field.
====*

## This works
!(images/ansio_paper.png) <<height:500px>>
[J. Chem. Phys. 2013](http://scitation.aip.org/content/aip/journal/jcp/138/17/10.1063/1.4803099)
====
## Protein Caricatures

Good approximation of the near field, poor up close.

Captures the anisotropic field
_especially_ near the *isoelectric point*.

Macrocharge approximations make for reasonable
models of large protein solutions.

====
# So Far...

Excluded volume for modeled as a hard sphere.

Representation of the protein _electrostatics_ 
in an ionic solution for a given pH.
====+
<br>
## What's next?
_(work in progress)_

====
## Remember this?

# $B_2 = -\frac{1}{2|\Omega|^2} \int_0^\infty \int_{\Omega_1} \int_{\Omega_2} (e^{-U(r,\omega_1,\omega_2)/k_B T} - 1) r^2 d \omega_1 d \omega_2 dr$

Our charge distributions are _not isotropic_ anymore, 
we _must_ to compute this:

## $\int_{\Omega_1} \int_{\Omega_2} (e^{-U(r,\omega_1,\omega_2)/k_B T} - 1) r^2 d \omega_1 d \omega_2 dr$

====*
## Sampling woes

##$\iint_{\Omega^2} (e^{-U/k_B T} - 1)d \omega_{12}$

There are many pairwise orientations.
Blind sampling may miss specific interactions.
Need to know at different $k_B T$ if we want to scale the model.
====*
## Density of states

## $\iint_{\Omega^2} (e^{-U/k_B T} - 1)d \omega_{12}$

counts the number of ways 
we can get a particular energy, $s(E)$

# $= \int_{E_{\text{low}}}^{E_{\text{high}}}  s(E') (e^{-E'/k_B T} - 1) d E'$
efficiently calculate $s(E)$ with Wang-Landau.
====*

Calculate the *non-ideality* of a protein molecule after including both the excluded volume _and_ electrostatics.

Predict the second-virial coefficient as a function of pH values, protein concentrations, binary mixtures, and salt concentrations.

If experimental results agree, use the model in higher-order simulations to predict phase behavior via Gibb's ensembles.
====+
<br>
### That would be really neat.
====*
### Results for Ovalbumin
!(images/fit_B22_1OVA.png) <<height:500px>>
====*
## Future work
Large scale Monte-Carlo simulation using macrocharges. 
!(images/MC1.png) <<transparent>>
!(images/MC2.png) <<transparent>>
_results for square-well potentials shown_


====*

# Thanks, you.

====*
|### How were these slides made?

####|Math Rendering: $\text{\LaTeX}$
####|JavaScript    : [reveal.js](http://hakim.se/projects/reveal-js)
####|Markdown      : [Daring Fireball](http://daringfireball.net/)

----

####|Markdown to HTML: [md2reveal.py](https://github.com/thoppe/md2reveal)

====*

## How does it work?

A *text-based* human-readable markup.
SVG equations $e^{i \pi} = -1$, and [links](http://thoppe.github.io/)!
The code for _this particular slide_ looks like this:

    ## How does it work?
    
    A *text-based* human-readable markup. 
    Equation rendering is simple $e^{i \pi} = -1$.
    and [links](http://thoppe.github.io/)!
    The code for this _particular slide_ looks like this:
