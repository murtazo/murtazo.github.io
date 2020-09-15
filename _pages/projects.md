---
layout: page
title: Projects
permalink: /projects/
description: 
nav: true
order: 4
---

<div class="projects grid">

  {% assign sorted_projects = site.projects | sort: "importance" %}
  {% for project in sorted_projects %}
  <div class="grid-item">
    {% if project.redirect %}
    <a href="{{ project.redirect }}" target="_blank">
    {% else %}
    <a href="{{ project.url | relative_url }}">
    {% endif %}
      <div class="card hoverable">
        {% if project.img %} 
        <!-- <img src="{{ project.img | relative_url }}" alt="project thumbnail"> -->
        {% endif %}
        <div class="card-body">
          <!-- <h2 class="card-title text-lowercase">{{ project.title }}</h2> -->
          <!-- <h2 class="card-title">{{ project.title }}</h2> -->
          <!-- <p class="card-text">{{ project.description }}</p> -->
        <article>
          <div class="row">
            <div class="profile col-3">
              <img src="{{ project.img | relative_url }}" alt="project thumbnail">
            </div>
            <div class="col">
              <h2 class="card-title">{{ project.title }}</h2>
              <p class="card-text">{{ project.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </a>
  </div>
{% endfor %}

</div>

