#!/.venv/bin/python

# Standard libs
import subprocess
import logging


def get_clipboard():
    """Función para obtener el texto del cual has realizado Ctl + C"""
    try:
        result = subprocess.run(["wl-paste"], capture_output=True, text=True, timeout=1)

        content = result.stdout.strip()

        if content:
            return "Puedes explicarme este contenido: " + content

        return ""

    except Exception as e:
        logging.error("Error al obtener el portapapeles:", e)
        return ""
