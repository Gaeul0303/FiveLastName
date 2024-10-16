# 필요한 라이브러리 임포트
import warnings
import mysql.connector
import pandas as pd
import json
from sklearn.linear_model import LinearRegression

# 경고 메시지 억제
warnings.filterwarnings("ignore")

# MySQL 클라이언트 연결
connect = mysql.connector.connect(
    host='localhost',
    user='root',
    password='12345',
    database='erp'
)

# SQL 쿼리 실행하여 데이터 가져오기
query = "SELECT * FROM dataset"
data = pd.read_sql(query, connect)

# 특성과 타겟 변수 정의
X = data[['Ziua saptamanii', 'Rata inflatiei BNR pe trimestru', 'Rata somaj BIM lunara']]
y = data['Categoria 3']

# 선형 회귀 모델 훈련
model = LinearRegression()
model.fit(X, y)

# 예측 수행
predictions = model.predict(X)

# 결과를 JSON 형식으로 출력
output = {
    "predicted_demand": predictions.tolist(),
    "actual_demand": y.tolist()
}

# JSON 파일로 저장
with open('C:/dev/Site/output.json', 'w', encoding='utf-8') as json_file:
    json.dump(output, json_file, ensure_ascii=False)

# 연결 종료
connect.close()
