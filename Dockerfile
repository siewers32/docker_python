FROM python:trixie

RUN useradd -m appuser

# Stel de werkmap in
WORKDIR /home/appuser/app

USER appuser
# Kopieer de requirements file en installeer de afhankelijkheden
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

