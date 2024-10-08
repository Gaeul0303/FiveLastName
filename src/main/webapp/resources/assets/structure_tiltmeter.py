import mysql.connector
import json

# MySQL 데이터베이스 연결
db = mysql.connector.connect(
    host='localhost',
    user='root',  # 사용자명
    password='12345',  # 비밀번호
    database='shm'  # 사용할 데이터베이스명
)

cursor = db.cursor(dictionary=True)  # 결과를 딕셔너리 형태로 받기

# 데이터 추출
cursor.execute("SELECT * FROM structure_tiltmeter")
rows = cursor.fetchall()

# JSON 파일로 저장
with open('structure_tiltmeter.json', 'w') as json_file:
    json.dump(rows, json_file, indent=4)

# 연결 종료
cursor.close()
db.close()