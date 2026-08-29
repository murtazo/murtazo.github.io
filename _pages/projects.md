---
layout: page
title: Numerical simulations
nav_title: Projects
permalink: projects/
description: A gallery of numerical experiments in fluid dynamics, shock waves, and multiphysics.
nav: true
order: 5
page_class: simulations-page
---

<p class="simulations-intro">These examples illustrate structure-preserving and stabilized methods for challenging partial differential equations. Select a simulation for numerical details, or play an available animation.</p>

<nav class="simulation-categories" aria-label="Simulation categories">
  {% for category in site.data.simulations %}
    <a href="#{{ category.id }}">{{ category.title }}</a>
  {% endfor %}
</nav>

{% for category in site.data.simulations %}
<section class="simulation-section" id="{{ category.id }}">
  <header class="simulation-section-header">
    <p class="simulation-section-number">0{{ forloop.index }}</p>
    <div>
      <h2>{{ category.title }}</h2>
      <p>{{ category.description }}</p>
    </div>
  </header>

  <div class="simulation-grid">
    {% for simulation in category.simulations %}
    {% assign simulation_href = simulation.href %}
    {% unless simulation.external %}{% assign simulation_href = simulation.href | relative_url %}{% endunless %}
    {% assign video_href = simulation.video %}
    {% if simulation.video_local %}{% assign video_href = simulation.video | relative_url %}{% endif %}
    <article class="simulation-card">
      <a class="simulation-image" href="{{ simulation_href }}"{% if simulation.external %} target="_blank" rel="noopener"{% endif %}>
        <img src="{{ simulation.image | relative_url }}" alt="{{ simulation.title }}" loading="lazy">
        {% if simulation.video %}<span class="simulation-video-badge" aria-hidden="true">▶ Animation</span>{% endif %}
      </a>
      <div class="simulation-card-body">
        <h3><a href="{{ simulation_href }}"{% if simulation.external %} target="_blank" rel="noopener"{% endif %}>{{ simulation.title }}</a></h3>
        <p>{{ simulation.description }}</p>
        <ul class="simulation-tags" aria-label="Methods and topics">
          {% for tag in simulation.tags %}<li>{{ tag }}</li>{% endfor %}
        </ul>
        <div class="simulation-links">
          <a href="{{ simulation_href }}"{% if simulation.external %} target="_blank" rel="noopener"{% endif %}>{{ simulation.link_label | default: "Numerical details" }}</a>
          {% if simulation.video %}<a href="{{ video_href }}" target="_blank" rel="noopener">Watch animation ↗</a>{% endif %}
        </div>
      </div>
    </article>
    {% endfor %}
  </div>
</section>
{% endfor %}
