# 1. More information
## 1.1 Usecase diagram
<img src="https://user-images.githubusercontent.com/53938599/123781289-440e1b00-d8fe-11eb-873b-d09f09d28ff9.jpeg" height="350">

_Usecase diagram of Levart website_
## 1.2 Program languages
- Frontend: Bootstrap, JS
- Backend: Java
- Frameworks: Spring MVC, Hibernate
- View Engine: JSP
- Database: SQL Server
- Python: For chatbot and sentiment analysis

# 2. Run the project
## 2.1 Set up environment
Something need to exists in yours system:
- [jdk](https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/downloads-list.html)
  > JDK is a key platform component for building Java applications.
- [Apache Tomcat](https://tomcat.apache.org/download-90.cgi)
  > Tomcat provides a "pure Java" HTTP web server environment in which Java code can run.
- Tools to run java j2ee projects like: Eclipse, intellij, netbeans, vs code,... and then, download Tomcat server
- Download [Python](https://www.python.org/downloads/release/python-379/):
  > Note: The version of python should be from 3.6 to 3.8, which would suitable for rasa
- Download **rasa** by **pip**:

    `pip install rasa`
  
    > Rasa is a framework for developing AI powered, industrial grade chatbots
## 2.2 Replace file name and their values
### 2.2.1 Config Hibernate
- Rename file **hibernate.cfg.virtual.xml** in **src/main/resources/** to **hibernate.cfg.xml**
- Replace **?** in the _hibernate.cfg.xml_ file with **yours values**
  + hibernate.connection.password: Database password
  + hibernate.connection.username: Database username

### 2.2.2 Chatbot action
- Rename file **actions.virtual.py** in **chatbot/actions/** to **actions.py**
- Replace **?** in the _actions.py_ file with **yours values**
  + server: Database server
  + username: Database username
  + password: Database password
  + port: Specify an alternate database port
 
### 2.2.3 Analyse Feedback Sentiment
- Copy file **sentimentAnalysis.py** to any place you want
- In **analiseSentiment** function of **src/main/java/com/levart/controller/FeedbackController.java** file:
  + Replace **pythonPath** with the path of **sentimentAnalysis.py** file abow in yours system
  + Replace **pythonExe** with the path of **python.exe** file in yours system  

## 2.3 Import database
Import file levart_database.sql to SQL Server Management

## 2.4 Run
- Start tomcat server to run the project
- In chatbot folder, run command lines below to pop up chatbot

  `rasa train`
  <br/>
  `python -m rasa_sdk --actions actions`
  <br/>
  `rasa run -m models --enable-api --cors "*"`
----------------
Hope you enjoy discovering interested tours with us!! :relaxed: :heart:
