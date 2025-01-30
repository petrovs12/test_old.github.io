---
id: 9q09ip3c8qbosjvik36qbor
title: HTML
desc: ""
updated: 2024-12-15T22:35
created: 1645783839882
---
some information from here used from: !()[https://bookdown.org/yihui/blogdown/css.html]

body and head

Validate html code via:
[w3 validatoro
](https://validator.w3.org)

6 possible header lavels `(h1, h2, h3, h4, h5, h6)`.

CSS is language to describe the look and formatting of 
documents, written in HTML. CSS is respondible for the visual style of your site.

[[engineering.technologies.Web Techologies.Hugo]] is a technology for web development.

this makes everything w/ id 'favorite' italic.

```{html}
<html>
<style> 
#favorite {
    font-style: italic;
}
</style>
<ul id="tea-list">
  <li>Earl Grey</li>
  <li>Darjeeling</li>
  <li>Oolong</li>
  <li>Chamomile</li>
  <li id="favorite">Chai</li>
</ul>
</html>
```

What goes inside the linked CSS document is essentially a list of rules (the same list could appear internally between the style tags, if you are using the second method). Each rule must include both a selector or group of selectors, and a declarations block within curly braces that contains one or more property: value; pairs. Here is the general structure for a rule:

```{css}

selectorlist {
    property: value;
    /* more property: value; pairs*/
}
```

