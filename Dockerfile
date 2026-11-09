# Menggunakan Python 3.12 sesuai spesifikasi kebutuhan perangkat lunak
FROM python:3.12-slim

# Menentukan direktori kerja di dalam container
WORKDIR /app

# Menyalin file requirements.txt dan menginstal dependensi
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Menyalin seluruh source code ke dalam container
COPY . .

# Membuka port 5000 untuk Flask/Gunicorn
EXPOSE 5000

# Menjalankan aplikasi menggunakan Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "3", "--timeout", "120", "app:app"]