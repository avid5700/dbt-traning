{% macro markup(a, b) %}
 ({{ a }} -{{ b }}) / {{ b }} 
{% endmacro %}