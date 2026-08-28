---
layout: page
title: Research
permalink: /research/
nav: true
order: 2
---

My research is in **numerical analysis and scientific computing for partial differential equations**, with particular emphasis on the design and analysis of robust, high-order, and structure-preserving numerical methods.

The main applications I work on arise in **compressible fluid dynamics, magnetohydrodynamics, kinetic plasma physics, and fusion modeling**.

## Structure-preserving numerical methods

A central theme of my research is the development of numerical methods that retain important mathematical and physical properties of the underlying PDEs at the discrete level.

Depending on the model, these properties may include

- conservation of mass, momentum, and energy,
- positivity of density, pressure, or distribution functions,
- invariant-domain preservation,
- discrete entropy inequalities,
- maximum principles,
- preservation of geometric or differential constraints,
- nonlinear stability.

I am particularly interested in methods that combine these structural properties with **high-order accuracy and computational efficiency**.

My work in this area includes

- finite element methods,
- summation-by-parts (SBP) finite difference methods,
- invariant-domain-preserving schemes,
- positivity-preserving methods,
- convex limiting and flux-corrected transport,
- entropy and residual viscosity methods,
- nonlinear stabilization of continuous Galerkin methods.

## Computational fluid dynamics

I work on numerical methods for nonlinear hyperbolic and fluid systems, with applications to both smooth and strongly nonlinear flow regimes.

Models of interest include

- compressible Euler equations,
- compressible Navier--Stokes equations,
- incompressible Navier--Stokes equations,
- nonlinear scalar conservation laws.

Particular interests include

- high-speed compressible flows,
- shock capturing,
- high-order continuous finite element methods,
- stabilization of central discretizations,
- entropy-stable and invariant-domain-preserving schemes,
- implicit large eddy simulation,
- adaptive numerical methods.

An important goal is to construct methods that remain reliable for under-resolved computations while retaining high-order accuracy in smooth regions.

## Magnetohydrodynamics

Another major direction of my research concerns numerical approximation of **magnetohydrodynamic systems**, including models relevant to compressible plasma dynamics.

I work on numerical methods for

- ideal compressible MHD,
- viscous and resistive MHD,
- Hall-MHD-type models,
- positivity-preserving and invariant-domain-preserving discretizations,
- entropy-stable and structure-preserving schemes.

MHD systems are particularly challenging because numerical methods must simultaneously handle strong nonlinearities, shocks, positivity constraints, and physical constraints associated with the magnetic field.

## Kinetic plasma models and fusion

A significant part of my current research is devoted to kinetic descriptions of plasmas and numerical methods for fusion applications.

The main models include

- Vlasov--Poisson equations,
- Vlasov--Maxwell systems,
- kinetic transport equations,
- coupled plasma-field models.

My interests include

- high-order finite element discretizations,
- high-order SBP finite difference methods,
- positivity preservation,
- conservation properties,
- discrete preservation of physical invariants,
- low-rank approximations,
- efficient high-dimensional solvers,
- GPU-accelerated scientific computing.

A key challenge in kinetic plasma simulations is the extremely large phase-space dimension. I am therefore interested both in mathematical structure and in computational techniques that make large-scale simulations feasible.

## High-order finite element methods

Finite element methods form an important part of my research.

I am particularly interested in high-order continuous finite element approximations for nonlinear PDEs, including methods based on

- Lagrange finite elements,
- compatible finite element spaces,
- nonlinear stabilization,
- graph-based artificial viscosity,
- residual-based stabilization,
- convex limiting,
- high-order positivity preservation.

One recurring objective is to obtain methods that behave like robust low-order schemes near discontinuities while recovering high-order accuracy in smooth regions.

## Summation-by-parts methods

I also work with **summation-by-parts finite difference operators**.

SBP operators provide a discrete analogue of integration by parts and therefore offer a useful framework for deriving stable high-order discretizations.

My recent interests include

- central and upwind SBP operators,
- high-order stabilization,
- kinetic transport equations,
- Vlasov--Maxwell systems,
- conservation and stability properties,
- matrix-free and GPU implementations.

## Nonlinear stabilization

Many of the PDEs I work with develop shocks, steep gradients, or fine-scale structures. High-order central discretizations therefore require appropriate nonlinear stabilization.

Methods I have worked on include

- entropy viscosity,
- residual viscosity,
- graph viscosity,
- parabolic regularization,
- flux-corrected transport,
- convex limiting,
- maximum-principle-preserving methods,
- invariant-domain-preserving methods.

I am particularly interested in stabilization strategies that are mathematically interpretable and whose amount of numerical dissipation adapts automatically to the local solution.

## Low-rank and high-dimensional approximation

High-dimensional kinetic problems motivate the use of reduced representations.

My research in this direction includes

- low-rank tensor approximations,
- geometric low-rank methods,
- noise reduction for kinetic particle methods,
- positivity-preserving low-rank approximations,
- efficient representation of phase-space solutions.

The objective is to reduce computational complexity while retaining the physical structure of the original problem.

## Multiscale problems

I also have research interests in

- numerical homogenization,
- heterogeneous multiscale methods,
- multiscale wave propagation,
- numerical methods for problems with strongly varying coefficients.

These topics connect to my broader interest in developing numerical methods that remain reliable when the underlying PDE contains multiple interacting spatial or temporal scales.

## Current research directions

My current research is particularly focused on

- structure-preserving high-order methods for kinetic plasma models,
- positivity-preserving methods for compressible flow and MHD,
- high-order SBP methods for Vlasov--Maxwell systems,
- robust finite element methods for compressible Euler equations,
- low-rank approximations for kinetic equations,
- scalable and GPU-accelerated solvers for high-dimensional PDEs.

For publications related to these topics, see the [Publications](/publications/) page.
