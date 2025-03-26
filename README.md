## HR Analytics Project: Workforce insights Data-Driven Decision-Making
This project leverages Python (ETL) pipleine, SQL Server, Power BI, and DAX to transform raw HR data into actionable insights.

### **Overview**
This project leverages Python, SQL Server, Power BI, and DAX to transform raw HR data into actionable insights. Using ETL pipline, the data was extracted, cleaned,enriched and loaded into a SQL reational database for further analysis. Business intelligence techniques were applied to analyze turnover trends,salary distribution, workforce demographics, and employee engagement, helping HR teams make informed decisions. The dataset, sourced from a **CSV file, contains 1.2 million records** with eight key atributes:
* Hired Date
* Leave Date
* Marital Status
* Gender
* Job Title
* Salary
* Department
* Job Category
To enhance the data structure, the additional columns such as EmployeeID,Job TitleID,Department ID, and Job Category ID were created. the project utilizes **Python, SQL Server, Power BI, and DAX(Data Analysis Expression)** to anlyze workforce trends and provide actionable recommendations.

### **Project Workflow**
![WhatsApp Image 2025-03-21 at 7 21 25 PM](https://github.com/user-attachments/assets/80554555-6bc4-46d2-b3a9-ec88678e86ed)


1. **Data Extraction & Preprocessing**
    * Extracted HR data from a CSV file using Python (Pandas,Numpy) libraries.
    * Cleaned missing values, removed duplicates, and corrected inconsistencies
    * Converted date fields to appropratite formats for analysis
![Data Extraction overview on Python](https://github.com/user-attachments/assets/99146bd4-15d5-4183-8567-b8dc6b8cb022)

2. **Data Enrichment & Feature Engineering**
   * Created unique identifiers for Job Titles, Departments, and Job Categories
   * Enhanced data structure for efficient querying and reporting.
![Data Enrichment_Python](https://github.com/user-attachments/assets/8ebe4bd4-bc1f-4a65-be71-6c818d351a6c)
![Data Cleaning   Preprocessing View_Python](https://github.com/user-attachments/assets/db6951d7-e859-44d1-a858-017f0ce86a94)

3. **Database Creation & Data Modelling (SQL Server)**
     * Designed a relational database with Employee as the fact table
       ![TransfomedData_SSMS View](https://github.com/user-attachments/assets/bd2783dc-5d90-4eaf-a8dc-856b8d8fda12)
     * Created dimension tables (Department, Job Title, Job Category, Salary)
       ![Creating Dimensions Tables_SQL](https://github.com/user-attachments/assets/233953b9-b5e5-4285-ac4d-efaa5acf1711)
     * Established relationships through **ER diagrams**
       ![Data Model  ](https://github.com/user-attachments/assets/3de95bda-bb54-4545-a5a1-9fd2343db94d)

4.  **Data Analysis & Business Insights (SQL Server)**
      * Answered 19+ business questions using SQL queries
        ![Employee Turnover across department](https://github.com/user-attachments/assets/9080d2da-e41b-4525-8588-42449b84d7c3)
        ![Employee Attrition Rate across Department](https://github.com/user-attachments/assets/cb6c1162-d49e-48b4-b450-319867b74493)
        ![Average Salary by Job_Title](https://github.com/user-attachments/assets/b15ed993-1e65-42da-9f1f-57d8dcaabade)
        ![Average Salary by Department   Marital Status distribution](https://github.com/user-attachments/assets/a73554da-7bcd-4d6e-bba7-8a80a54b6f29)
      * Applied aggregations, subqueries, case statements, joins, and window functions
      * ![SubQuery_SQL_View_1](https://github.com/user-attachments/assets/dc8e64a9-b087-4a83-82c7-f9252f616e8c)

5.  **Visualization & Dashboard Development (Power BI)**
      * Conncted Power BI to SQL Server using Direct Query mode
      * Created a Hired Year slicer and Active/ Inactive Employee Status column
        ![Power Query_Data Engineering_Power BI](https://github.com/user-attachments/assets/6f0459ef-a487-414b-9e4d-e6dc18d834bc)
      *  Implemented **DAX measures** to calculate:
          * Salary dispersion ratio
          * Employeee demographics (gender, marital status)
          * Turn over rate by department
          ![Total Mangers Power BI](https://github.com/user-attachments/assets/a2b181f2-073d-415c-b7d2-0a261901586f)
          ![Total Divorced](https://github.com/user-attachments/assets/253815df-1ba8-483e-9381-f6e2c409cc96)
          ![Total Active Employees](https://github.com/user-attachments/assets/dfa925f9-9b4f-45cd-b7de-2d47b6dfc685)
          ![Salary Dispersion Ratio Power BI](https://github.com/user-attachments/assets/d2fa4f5b-eb79-4bbf-8c9a-1b48d6ecceb9)
          ![HR Analysis Dashboard_Final Output](https://github.com/user-attachments/assets/d000567e-dfe1-4b6b-a2ab-1f9b3a2b6639)

### **Key Technologies & Tools**
* **Python (Pandas, Numpy,SQLALchemy)**: Data extraction, transformation, and loading(ETL)
* **SQL Server:** Database creation, modelling, and analysis.
* **Power BI:** Dashboard development, Advanced measures, calculated fields for insights and data visualization.

### **Conclusion & Recommendations**
This HR anlytics project leveraged Pyton for ETL pipelines, SQL for structured data storage, and Power BI for visualization, transforming raw HR data into actionable insights. By automating data extraction, transformation, and loading (ETL), cleaned data was seamlessly integrated into SQL Server, enabling efficient analysis of turnover rates, slary distribution, and workforce demographics.

**Recommendations:**
1. **Investigate Employee Turnover Causes:** Add a column for **"Reason for Exit"** to improve retention strategies.
2. **HR Department Turnover:** Address high attrition rates with employee engagement intiatives.
3. **Salary Benchmarking:** Align slaries with industry standards to improve satisfaction.
4. **Real-Time Data Automation:** Enhance Python ETL pipelines for continous data updates.



