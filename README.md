#PRAKTIKUM6_SQL

`Nama  : Faizah Via Fadhillah`

`Nim   : 312210460`

`Kelas : TI22.A4`

# ER-D Karyawan

![img.1](gambar/er-d.png)

# Input Data Studi Kasus

1. Tabel Perusahaan

    ![img.2](gambar/1.png)

2. Tabel Departemen

    ![img.3](gambar/2.png)

3. Tabel Karyawan

    ![img.4](gambar/3.png)

4. Tabel Project

    ![img.5](gambar/4.png)

5. Tabel Project Detail

    ![img.6](gambar/5.png)


# SQL JOIN

1. Menampilkan Nama Manager tiap Departement

    Script:

    ```sql
    Select Departemen.nama AS Departemen, Karyawan.nama AS Manajer
    FROM Departemen
    LEFT JOIN Karyawan ON Karyawan.nik = Departemen.manajer_nik;
    ```

    Output:

    ![img.7](gambar/6.png)

2. Menampilkan Nama Supervisor tiap karyawan

    Script:

    ```sql
    SELECT Karyawan.nik, Karyawan.nama, Departemen.nama AS Departemen, Supervisor.nama AS Supervisor
    FROM Karyawan
    LEFT JOIN Karyawan AS Supervisor ON Supervisor.nik = Karyawan.sup_nik
    LEFT JOIN Departemen ON Departemen.id_dept = Karyawan.id_dept;
    ```

    Output:

    ![img.8](gambar/7.png)

3. Menampilkan daftar karyawan yang bekerja pada project A

    Script:

    ```sql
    SELECT Karyawan.nik, Karyawan.nama
    FROM Karyawan
    JOIN Project_detail ON Project_detail.nik = Karyawan.nik
    JOIN Project ON Project.id_proj = Project_detail.id_proj
    WHERE Project.nama = 'A';
    ```

    Output:

    ![img.9](gambar/8.png)


# Latihan Praktikum

1. Departemen apa saja yang terlibat dalam tiap-tiap project

    Script:

    ```sql
    SELECT Project.nama AS Project, GROUP_CONCAT(Departemen.nama) AS Departemen
    FROM Project
    INNER JOIN Project_detail ON Project.id_proj = Project_detail.id_proj
    INNER JOIN Karyawan ON Project_detail.nik = Karyawan.nik
    INNER JOIN Departemen ON Karyawan.id_dept = Departemen.id_dept
    GROUP BY Project.id_proj;
    ```

    Output"

    ![img.10](gambar/9.png)

2. Jumlah karyawan tiap departemen yang bekerja pada tiap-tiap project

    Script:

    ```sql
    SELECT Project.nama AS Project, Departemen.nama AS Departemen, COUNT(*) AS 'Jumlah Karyawan'
    FROM Project
    INNER JOIN Project_detail ON Project.id_proj = Project_detail.id_proj
    INNER JOIN Karyawan ON Project_detail.nik = Karyawan.nik
    INNER JOIN Departemen ON Karyawan.id_dept = Departemen.id_dept
    GROUP BY Project.id_proj, Departemen.id_dept;
    ```

    Output:

    ![img.11](gambar/10.png)

3. Ada berapa project yang sedang dikerjakan oleh departemen RnD? 
(ket: project berjalan adalah yang statusnya 1)

    Script:

    ```sql
    SELECT COUNT(*) AS 'Jumlah Project'
    FROM Project
    INNER JOIN Project_detail ON Project.id_proj = Project_detail.id_proj
    INNER JOIN Karyawan ON Project_detail.nik = Karyawan.nik
    INNER JOIN Departemen ON Karyawan.id_dept = Departemen.id_dept
    WHERE Departemen.nama = 'RnD' AND Project.status = 1;
    ```

    Output:

    ![img.12](gambar/11.png)

4. Berapa banyak Project yang sedang dikerjakan oleh Ari?

    Script:

    ```sql
    SELECT COUNT(*) AS 'Jumlah Project'
    FROM Project_detail
    INNER JOIN Karyawan ON Project_detail.nik = Karyawan.nik
    WHERE Karyawan.nama = 'Ari' AND Project_detail.id_proj IN (SELECT id_proj FROM Project WHERE status = 1);
    ```

    Output:

    ![img.13](gambar/12.png)

5. Siapa saja yang mengerjakan Project B?

    Script:

    ```sql
    SELECT Karyawan.nama
    FROM Project_detail
    INNER JOIN Karyawan ON Project_detail.nik = Karyawan.nik
    WHERE Project_detail.id_proj IN (SELECT id_proj FROM Project WHERE nama = 'B');
    ```

    Output:

    ![img.14](gambar/13.png)







