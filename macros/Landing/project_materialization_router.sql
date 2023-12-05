{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {{ log("Running generate database name macro") }}
    {% set default_database = target.database %}
    {% set production_database = 'prod-406711' %}

    {% if custom_database_name %}

    
        {% if target.name == "DBT_PROD" %}

            {{ production_database }}

        {% else %}

            {{ custom_database_name }}

        {% endif %}
        

    {% else %}

        {{ default_database }}

    {% endif %}

{% endmacro %}