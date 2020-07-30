---
layout: about
title: about
permalink: /
description_lab: <a href="www.it.uu.se"> Division of Scientific Computing, Department of Information Technology </a>
description_lab: <a href="http://www.uu.se" class="page-description" target="_blank">Uppsala University</a>	

profile:
  align: left
  image: 1.jpg
  address: 
    <p>
    <h4>ITC building 2, floor 4, room 2421 <br>
    Lagerhyddsvägen 2 <br>
    752 37, Uppsala, Sweden
    </h4>
   </p>
   <div id="social-media">
  <span class="contact-icon text-center">
    <a href="mailto:{{ site.email | encode_email }}"><i class="fas fa-envelope"></i></a>
  {% if site.orcid_id %}<a href="https://orcid.org/{{ site.orcid_id }}" target="_blank" title="ORCID"><i class="ai ai-orcid"></i></a>{% endif %}
  {% if site.scholar_userid %}<a href="https://scholar.google.com/citations?user={{ site.scholar_userid }}" target="_blank" title="Google Scholar"><i class="ai ai-google-scholar"></i></a>{% endif %}
  {% if site.publons_id %}<a href="https://publons.com/a/{{ site.publons_id }}/" target="_blank" title="Publons"><i class="ai ai-publons"></i></a>{% endif %}
  {% if site.research_gate_profile %}<a href="https://www.researchgate.net/profile/{{site.research_gate_profile}}/" target="_blank" title="ResearchGate"><i class="ai ai-researchgate"></i></a>{% endif %}
  {% if site.github_username %}<a href="https://github.com/{{ site.github_username }}" target="_blank" title="GitHub"><i class="fab fa-github"></i></a>{% endif %}
  {% if site.linkedin_username %}<a href="https://www.linkedin.com/in/{{ site.linkedin_username }}" target="_blank" title="LinkedIn"><i class="fab fa-linkedin"></i></a>{% endif %}
  {% if site.twitter_username %}<a href="https://twitter.com/{{ site.twitter_username }}" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>{% endif %}
  {% if site.medium_username %}<a href="https://medium.com/@{{ site.medium_username }}" target="_blank" title="Medium"><i class="fab fa-medium"></i></a>{% endif %}
  {% if site.quora_username %}<a href="https://www.quora.com/profile/{{ site.quora_username }}" target="_blank" title="Quora"><i class="fab fa-quora"></i></a>{% endif %}
  {% if site.blogger_url %}<a href="{{ site.blogger_url }}" target="_blank" title="Blogger"><i class="fab fa-blogger-b"></i></a>{% endif %}
  {% if site.strava_userid %}<a href="https://www.strava.com/athletes/{{ site.strava_userid }}" target="_blank" title="Strava"><i class="fab fa-strava"></i></a>{% endif %}
  </span>
</div>


news: true
social: false
---
	
{%include social.html %}

Write your biography here. Tell the world about yourself. Link to your favorite [subreddit](http://reddit.com){:target="\_blank"}. You can put a picture in, too. The code is already in, just name your picture `prof_pic.jpg` and put it in the `img/` folder.

Put your address / P.O. box / other info right below your picture. You can also disable any these elements by editing `profile` property of the YAML header of your `_pages/about.md`. Edit `_bibliography/papers.bib` and Jekyll will render your [publications page](/al-folio/publications/) automatically.

Link to your social media connections, too. This theme is set up to use [Font Awesome icons](http://fortawesome.github.io/Font-Awesome/){:target="\_blank"} and [Academicons](https://jpswalsh.github.io/academicons/){:target="\_blank"}, like the ones below. Add your Facebook, Twitter, LinkedIn, Google Scholar, or just disable all of them.
