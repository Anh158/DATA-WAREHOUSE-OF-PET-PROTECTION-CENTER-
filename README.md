# DATA-WAREHOUSE-OF-PET-PROTECTION-CENTER
1.Mục đích:
Xây dựng Cơ sở dữ liệu để lữu trữ dữ liệu thu thập được từ một cơ sở giải cứu thú cưng.
Thiết kế ETL thực hiện đưa dữ liệu từ tập tin có sẵn vào database.

2.Thiết kế Data warehouse 
2.1 Mô tả tập dữ liệu:
Tập tin sẵn có bao gồm các trường dữ liệu như sau
Các trường của tập dữ liệu sẽ như sau:
+ PetID - int - ID duy nhất của một vật nuôi.
+ Type - varchar(3) - Loài của vật nuôi (Chó hoặc Mèo).
+ Age - int - Số tháng tuổi của vật nuôi.
+ Breed1 - varchar(255) - Giống chính của vật nuôi.
+ Breed2 - varchar(255) - Giống thứ hai của  vật nuôi (nếu là giống lai).
+ Gender - varchar(6) - Giới tính của vật nuôi (Male, Female, Mixed)
+ Color1 - varchar(255) - Màu sắc thứ nhất của vật nuôi.
+ Color2 - varchar(255) - Màu sắc thứ hai của vật nuôi (Nếu có).
+ Color3 - varchar(255) - Màu sắc thứ ba của vật nuôi (Nếu có).
+ MaturitySize - varchar(13) - Kích thước khi trưởng thành (Small, Medium, Large, Extra Large, Not Specified).
+ FurLength - varchar(13) - Độ dài lông (Short, Medium, Long, Not Specified).
+ Vaccinated - varchar(8) - Thú cưng đã được tiêm phòng chưa (Yes, No, Not Sure).
+ Dewormed - varchar(8) - Thú cưng đã được tẩy giun chưa (Yes, No, Not Sure).
+ Sterilized - varchar(8) - Thú cưng đã được triệt sản chưa (Yes, No, Not Sure).
+ Health - varchar(14) - Tình trạng sức khỏe (Healthy, Minor Injury, Serious Injury, Not Specified).
+ Quantity - int -Số lượng vật nuôi có trong hồ sơ.
+ Fee - int - Phí nhận nuôi.
+ State - varchar(255) - Vị trí tiểu bang.
+ RescuerID - int - Id của người giải cứu.

2.2 Xây dựng lược đồ cho Data warehouse 
Dựa vào tập dữ liệu có sẵn, 1 vật nuôi có nhiều thuộc tính khác nhau và một số thuộc tính có giá trị lặp lại như giống thú cưng,giới tính, màu sắc…Do đó tách các thuộc tính thành bảng khác nhau (Dimension table) đễ hỗ trợ việc sửa đổi các giá trị của thuộc tính về sau và phục vụ chuẩn hóa trong cơ sở dữ liệu. 
![image](https://user-images.githubusercontent.com/78602522/231821280-56b1d6ed-f3f0-4b17-a165-a04aaa69988a.png)
