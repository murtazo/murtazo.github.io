---
layout: page
title: Invariant domain preserving schemes
description: The aim of the project is to construct positivity, maximum principle, and invariant domain preserving continuous finite element methods for nonlinear conservation laws.
img: /assets/arts/cyl/cyl_366746_nodes_crop.png
importance: 1
---

To make all the features of the solution visible we often plot Schlieren gray-scale diagram of the vertical momentum $$\rho$$ given by
<div>
\[
    \sigma = \exp\left	(-\beta \frac{|\nabla \rho|}{\max_{\Omega}(|\nabla \rho|)} \right),
\]
</div>
where $$\beta=10$$.

<h5>Supersonic flow around circular cylinde</h5> 

In this example we consider a
  supersonic flow past a circular cylinder of radius $$0.25$$ centered
  at the point $$\boldsymbol{x} = (0.6, 1)$$ in a two-dimensional wind tunnel of
  size $$(x_1, x_2)\in [0, 4] \times [0, 2]$$. We use the $$\gamma$$-law
  with $$\gamma=\frac{7}{5}$$. The initial data is $$\rho=1.4$$, $$p=1$$,
  $$\boldsymbol v=(3,0)^\top$$. The Mach 3 flow enters from the left boundary
  $$\{x_1=0\}$$, where Dirichlet boundary conditions are prescribed.
  The slip boundary condition is applied at the walls $$\{x_2 = 0\}$$
  and $$\{x_2 = 2\}$$ and on the cylinder. Since the flow is supersonic,
  no boundary condition is applied at the outflow $$\{x_1=4\}$$.

<div class="row justify-content-center">
    <div class="col-sm-6">
        <img class="img-fluid rounded z-depth-1" 
        src="{{ '/assets/arts/cyl/cyl_366746_nodes_small.png' | relative_url }}"/>
    </div>
</div>
<div class="caption">
    Supersonic flow past circular cylinder. The mesh composed of <script type="math/tex">252820</script> unstructured <script type="math/tex">\mathbb P1</script> points and <script type="math/tex">\mbox{CFL}=0.3</script>.
</div>

  The flow enters the wind tunnel and hits the cylinder, then a strong
  bow shock develops at the front of the cylinder, while two attached
  oblique shocks develop from the back side of the cylinder.  The flow
  separates at the points where the oblique shocks start. After
  separation the flow fluctuates and creates small scale vortices
  traveling downstream.  The strong shocks travel towards the wall
  boundaries, reflect back in the tunnel, and pass through the small
  scale vortices.


<div class="row justify-content-center">
		<iframe 
			width="500" height="300"
     		src="https://www.youtube.com/embed/1bI4BIIa8Zc"
     		frameborder="0" 
     		allowfullscreen>
		</iframe>
</div>
<div class="caption">
    Animation of the cylinder problem.
</div>
