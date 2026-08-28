---
layout: page
title: Research
permalink: /research/
nav: true
order: 2
---

My research is in **numerical analysis and scientific computing for partial differential equations**. I develop robust, high-order methods for nonlinear problems in fluid dynamics, magnetohydrodynamics (MHD), and kinetic plasma physics.

## Structure-preserving numerical methods

A central goal of my work is to design discretizations that preserve essential properties of the underlying models: conservation laws, positivity, invariant domains, entropy inequalities, maximum principles, and nonlinear stability. Such properties are especially important when solutions contain shocks, steep gradients, or multiple scales.

I work with high-order finite element and summation-by-parts (SBP) finite difference methods, together with nonlinear stabilization techniques such as convex limiting, flux-corrected transport, and residual or entropy viscosity. The aim is to obtain schemes that are robust near nonsmooth features while retaining high-order accuracy in smooth regions.

## Fluid dynamics and magnetohydrodynamics

I study numerical methods for compressible and incompressible flow, nonlinear conservation laws, and ideal, viscous, and resistive MHD. These systems combine strong nonlinearities with physical constraints such as positivity of density and pressure, conservation of mass, momentum, and energy, and—in MHD—constraints on the magnetic field.

My interests include shock capturing, invariant-domain- and entropy-stable discretizations, nonlinear stabilization of continuous Galerkin methods, and reliable high-order simulation of under-resolved and high-speed flows.

## Kinetic plasma models and fusion

Another major focus is the numerical simulation of kinetic plasma models, including the Vlasov--Poisson and Vlasov--Maxwell systems. These problems are challenging because they combine delicate physical structure with very high-dimensional phase spaces.

I develop structure-preserving high-order methods, low-rank approximations, and efficient large-scale implementations for kinetic transport and coupled plasma-field models. This work includes finite element and SBP methods, positivity-preserving discretizations, and matrix-free or GPU-accelerated solvers.

## Additional interests

My broader interests include multiscale and homogenization methods, adaptive computation, parabolic regularization, and reduced representations for high-dimensional PDEs.

For publications related to these topics, see the [Publications](/publications/) page.
