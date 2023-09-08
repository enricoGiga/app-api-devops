# Some brief draft
### Best practices:
- Don't install unnecessary stuff in the docker container:
  - we don't need to install the linting (flake8) in production env



the GitHub action is basically a docker container used to perform a certain task.
github actions token dckr_pat_haTeOMweZY7tdRhTki2diPANmYQ
docker-compose run --rm app sh -c "flake8"
docker-compose run --rm app sh -c "django-admin startproject app ."
docker-compose run --rm app sh -c "python manage.py startapp core"

docker-compose run --rm app sh -c "python manage.py test"
docker-compose run --rm app sh -c "python manage.py wait_for_db && flake8"