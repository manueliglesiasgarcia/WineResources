@rem Install the Python packages that the build script depends upon
python -m pip install -r "%~dp0\requirements.txt"

@rem Run the build script, propagating any command-line arguments
python "%~dp0\build.py" %*
