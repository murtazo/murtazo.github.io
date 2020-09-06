---
layout: page
title: Incompressible flows
description: The incompressible Navier-Stokes equations are solved using continuous finite element approximation. 
img: /assets/arts/var_den/var_den_t_20_640x80_crop.png
importance: 3
---

<h5>ILES of Turbulent Flow around a Volvo Car</h5>

Implicit Large Eddy Simulation. The incompressible Navier-Stokes
equations is computed by a residual based streamline diffusion
stabilization, G2. Streamlines and magnitude of velocity for 
FEM solution with P1 elements for flow around a Volvo car with turbulent wake.
The implicit Cranck-Nicolson method is used for the time discretisation.
~100K unstructured mesh points

<div class="row justify-content-center">
		<iframe 
			width="500" height="300"
     		src="https://www.youtube.com/embed/HTOl0lTet9A"
     		frameborder="0" 
     		allowfullscreen>
		</iframe>
</div>
<div class="caption">
    Volvo car aerodynamics simulation
</div>

<h5>Variable density incompressible flow
</h5>

One can extend the incompressible solver that we develop to solve with additional advection equation either for density or temperature. 

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <img class="img-fluid rounded z-depth-1" 
        src="/assets/arts/var_den/var_den_t_20_640x80.png"/>
    </div>
</div>
<div class="caption">
    Lock-Exchange Problem, T=20, 640x80 P1 mesh points, Density, vorticity and artificial viscosity using residual viscosity
</div>