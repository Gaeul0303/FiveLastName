import pymysql
import pandas as pd
from matplotlib import pyplot as plt
import numpy as np  # numpy를 추가하여 위치 조절을 위해 사용합니다.
#한글 지정
plt.rcParams['font.family'] ='Malgun Gothic'
plt.rcParams['axes.unicode_minus'] =False
#클라이언트 오라클
# oracledb.init_oracle_client(lib_dir=r"C:\visual\python\oracle\instantclient_11_2")
connect = pymysql.connect(user='root', password='12345',charset='utf8', db='erp')

c=connect.cursor() #오라클 DB 쿼리문 c에 저장
#######################
c.execute("SELECT `structure`.`DATE`,`structure`.`TEMP`,`structure`.`CH1_A`,`structure`.`CH1_B`,`structure`.`CH1_C`,`structure`.`CH1_D`,`structure`.`CH2_A`,`structure`.`CH2_B`,`structure`.`CH2_C`,`structure`.`CH2_D`,`structure`.`CH3_A`,`structure`.`CH3_B`,`structure`.`CH3_C`,`structure`.`CH3_D`,`structure`.`CH4_A`,`structure`.`CH4_B`,`structure`.`CH4_C`,`structure`.`CH4_D`,`structure`.`CH5_A`,`structure`.`CH5_B`,`structure`.`CH5_C`,`structure`.`CH5_D`,`structure`.`CH6_A`,`structure`.`CH6_B`,`structure`.`CH6_C`,`structure`.`CH6_D`,`structure`.`CH7_A`,`structure`.`CH7_B`,`structure`.`CH7_C`,`structure`.`CH7_D`,`structure`.`CH8_A`,`structure`.`CH8_B`,`structure`.`CH8_C`,`structure`.`CH8_D`,`structure`.`CH9_A`,`structure`.`CH9_B`,`structure`.`CH9_C`,`structure`.`CH9_D`,`structure`.`CH10_A`,`structure`.`CH10_B`,`structure`.`CH10_C`,`structure`.`CH10_D`,`structure`.`CH11_A`,`structure`.`CH11_B`,`structure`.`CH11_C`,`structure`.`CH11_D`,`structure`.`CH12_A`,`structure`.`CH12_B`,`structure`.`CH12_C`,`structure`.`CH12_D`,`structure`.`CH13_A`,`structure`.`CH13_B`,`structure`.`CH13_C`,`structure`.`CH13_D`,`structure`.`CH14_A`,`structure`.`CH14_B`,`structure`.`CH14_C`,`structure`.`CH14_D`,`structure`.`CH15_A`,`structure`.`CH15_B`,`structure`.`CH15_C`,`structure`.`CH15_D`,`structure`.`CH16_A`,`structure`.`CH16_B`,`structure`.`CH16_C`,`structure`.`CH16_D` FROM `erp`.`structure`")

k=c.fetchall()
DATE = []
TEMP = []
# 채널 데이터 리스트 초기화
channels = [[] for _ in range(16)]  # 16개 채널에 대한 빈 리스트 생성

for i in k:
    DATE.append(i[0])  # 첫 번째 요소를 DATE에 추가
    TEMP.append(i[1])  # 두 번째 요소를 TEMP에 추가
    
    # 각 채널에 대한 데이터 추가
    for j in range(16):
        channel_data = i[2 + j * 4: 2 + (j + 1) * 4]  # 각 채널의 4개 값 가져오기
        channels[j].append(channel_data)  # 해당 채널 리스트에 추가

# 각 채널의 데이터를 분리하여 변수에 저장
CH1_A, CH1_B, CH1_C, CH1_D = zip(*channels[0]) if channels[0] else ([], [], [], [])
CH2_A, CH2_B, CH2_C, CH2_D = zip(*channels[1]) if channels[1] else ([], [], [], [])
CH3_A, CH3_B, CH3_C, CH3_D = zip(*channels[2]) if channels[2] else ([], [], [], [])
CH4_A, CH4_B, CH4_C, CH4_D = zip(*channels[3]) if channels[3] else ([], [], [], [])
CH5_A, CH5_B, CH5_C, CH5_D = zip(*channels[4]) if channels[0] else ([], [], [], [])
CH6_A, CH6_B, CH6_C, CH6_D = zip(*channels[5]) if channels[1] else ([], [], [], [])
CH7_A, CH7_B, CH7_C, CH7_D = zip(*channels[6]) if channels[2] else ([], [], [], [])
CH8_A, CH8_B, CH8_C, CH8_D = zip(*channels[7]) if channels[3] else ([], [], [], [])
CH9_A, CH9_B, CH9_C, CH9_D = zip(*channels[8]) if channels[0] else ([], [], [], [])
CH10_A, CH10_B, CH10_C, CH10_D = zip(*channels[9]) if channels[1] else ([], [], [], [])
CH11_A, CH11_B, CH11_C, CH11_D = zip(*channels[10]) if channels[2] else ([], [], [], [])
CH12_A, CH12_B, CH12_C, CH12_D = zip(*channels[11]) if channels[3] else ([], [], [], [])
CH13_A, CH13_B, CH13_C, CH13_D = zip(*channels[12]) if channels[0] else ([], [], [], [])
CH14_A, CH14_B, CH14_C, CH14_D = zip(*channels[13]) if channels[1] else ([], [], [], [])
CH15_A, CH15_B, CH15_C, CH15_D = zip(*channels[14]) if channels[2] else ([], [], [], [])
CH16_A, CH16_B, CH16_C, CH16_D = zip(*channels[15]) if channels[3] else ([], [], [], [])
# 필요한 만큼 계속 추가...
    
    
fig, ax = plt.subplots(figsize=(250, 100))
x = np.arange(len(DATE))  

# 막대 그래프 생성
# rects1 = ax.plot(x - width/2, TEMP, width, label='온도')  
# 채널 데이터를 플롯에 추가
channels_to_plot = []
rects2 = ax.plot(x, TEMP, label="온도")
for i in range(1, 17):  # 1부터 16까지의 채널
    for j in range(4):  # 각 채널에 대해 A, B, C, D
        channel_data = globals()[f'CH{i}_{["A", "B", "C", "D"][j]}']  # CH1_A, CH1_B 등을 가져옴
        rects = ax.plot(x, channel_data, label=f'CH{i} - {["A", "B", "C", "D"][j]}')
        channels_to_plot.append(rects)


# 축 및 제목 설정
ax.set_xlabel('날짜')
ax.set_ylabel('경사계')
ax.set_title('건전성 모니터링')
ax.set_xticks(x)  # x축 눈금 위치 설정
ax.set_xticklabels(DATE, rotation=45, ha='right')  # x축 눈금 레이블 설정 / rotation=45, ha='right' => 동 이름을 기울여서 출력
ax.legend()  # 범례 추가

plt.show()
