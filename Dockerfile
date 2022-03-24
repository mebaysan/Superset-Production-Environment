FROM apache/superset

# Switching to root to install the required packages
USER root

RUN pip install psycopg2

RUN pip install psycopg2-binary

# Switching back to using the `superset` user
USER superset

# If we set SUPERSET_CONFIG_PATH variable, CONFIG_PATH_ENV_VAR will be created while runtime and we will be able to override the configure variables [https://github.com/apache/superset/blob/master/superset/config.py#L1351]
COPY superset_config.py /app/

# If we want to use our custom logo. Also, it has to be set in superset_config.py
#COPY XYZ.png /app/superset/static/assets/images/

ENV SUPERSET_CONFIG_PATH /app/superset_config.py
