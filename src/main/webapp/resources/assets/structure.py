import pymysql
import pandas as pd
from matplotlib import pyplot as plt
import numpy as np  # numpy를 추가하여 위치 조절을 위해 사용합니다.
#한글 지정
plt.rcParams['font.family'] ='Malgun Gothic'
plt.rcParams['axes.unicode_minus'] =False
#클라이언트 오라클
# oracledb.init_oracle_client(lib_dir=r"C:\visual\python\oracle\instantclient_11_2")
connect = pymysql.connect(user='root', password='12345',charset='utf8', db='test')

c=connect.cursor() #오라클 DB 쿼리문 c에 저장
#######################
c.execute("SELECT temp.DATE, temp.TEMP, temp.CH1_A,temp.CH1_B,temp.CH1_C,temp.CH1_D,temp.CH2_A,temp.CH2_B,temp.CH2_C,temp.CH2_D,temp.CH3_A,temp.CH3_B,temp.CH3_C,temp.CH3_D,temp.CH4_A,temp.CH4_B,temp.CH4_C,temp.CH4_D,temp.CH5_A,temp.CH5_B,temp.CH5_C,temp.CH5_D,temp.CH6_A,temp.CH6_B,temp.CH6_C,temp.CH6_D,temp.CH7_A,temp.CH7_B,temp.CH7_C,temp.CH7_D,temp.CH8_A,temp.CH8_B,temp.CH8_C,temp.CH8_D,temp.CH9_A,temp.CH9_B,temp.CH9_C,temp.CH9_D,temp.CH10_A,temp.CH10_B,temp.CH10_C,temp.CH10_D,temp.CH11_A,temp.CH11_B,temp.CH11_C,temp.CH11_D,temp.CH12_A,temp.CH12_B,temp.CH12_C,temp.CH12_D,temp.CH13_A,temp.CH13_B,temp.CH13_C,temp.CH13_D,temp.CH14_A,temp.CH14_B,temp.CH14_C,temp.CH14_D,temp.CH15_A,temp.CH15_B,temp.CH15_C,temp.CH15_D,temp.CH16_A,temp.CH16_B,temp.CH16_C,temp.CH16_D FROM test.temp")

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
# ax.set_xlabel('날짜')
# ax.set_ylabel('경사계')
# ax.set_title('건전성 모니터링')
# ax.set_xticks(x)  # x축 눈금 위치 설정
# ax.set_xticklabels(DATE, rotation=45, ha='right')  # x축 눈금 레이블 설정 / rotation=45, ha='right' => 동 이름을 기울여서 출력
# ax.legend()  # 범례 추가

# plt.show()
