# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"

# from typing import Any, Text, Dict, List
#
# from rasa_sdk import Action, Tracker
# from rasa_sdk.executor import CollectingDispatcher
#
#
# class ActionHelloWorld(Action):
#
#     def name(self) -> Text:
#         return "action_hello_world"
#
#     def run(self, dispatcher: CollectingDispatcher,
#             tracker: Tracker,
#             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
#
#         dispatcher.utter_message(text="Hello World!")
#
#         return []
from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import FollowupAction
import pyodbc

# connect db
server = 'DESKTOP-IREKHJ2\SQLEXPRESS'
database = 'levart'
username = 'sa'
password = 'pastwent12345'
driver = '{ODBC Driver 17 for SQL Server}'
port = '1433'
cnn = pyodbc.connect('DRIVER='+driver+';PORT=port;SERVER='+server+';PORT=1443;DATABASE='+database+';UID='+username +
                     ';PWD='+password)
cursor = cnn.cursor()
# text = "'Ha Long Bay'"
# cursor.execute("SELECT * from tour where tourName like " + text)
# row = cursor.fetchone()
# while row:
#     print(row[0])
#     row = cursor.fetchone()
# action


class ActionHelloWorld(Action):
    def name(self) -> Text:
        return "action_list_tour"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        # dispatcher.utter_message(text="Hello World!")
        name = "tour"
        cursor.execute("SELECT * from " + name+";")
        btn = []
        row = cursor.fetchone()
        while row:
            btn.append({"payload": row[3], "title": row[3]})
            row = cursor.fetchone()
        # text = tracker.latest_message['text']
        # print(text)
        # dispatcher.utter_template("utter_thank", tracker, link=Link)
        dispatcher.utter_message(
            text="You can check out some tour:", buttons=btn)
        return []


class ActionGetTour(Action):
    def name(self) -> Text:
        return "action_get_detail_tour"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        entities = tracker.latest_message['entities']
        # print(entities[0]['value'])
        # text = tracker.latest_message['text']
        print(entities)
        if not entities:
            dispatcher.utter_message("Sorry! I do not quite get it. ")
            return [FollowupAction("action_list_tour")]

        elif entities[0]['entity'] == 'tour':
            text = entities[0]['value']
            cursor.execute(
                " select * from tour a, tourImage b where tourName like '%" + text + "%' and a.tourID = b.tourID and imageRole = 0 ")

            row = cursor.fetchone()
            if row is None:
                dispatcher.utter_message(
                    text="Sorry, Levart hasn't had "+text+" Tour yet.")
                return[FollowupAction(name='action_list_tour')]
            while row:
                dispatcher.utter_message(text=row[4])
                img = row[17]
                dispatcher.utter_message(image=img)
                des = "Price: $" + str(row[6]) + \
                    " and discount " + str(row[10]) + "%"
                dispatcher.utter_message(text=des)
                price = "Detail at: " + \
                    "http://localhost:8080/UIT-IE303-TravelWeb/tour-detail/" + \
                    str(row[0]) + " "
                dispatcher.utter_message(text=price)
                row = cursor.fetchone()
        # dispatcher.utter_template("utter_thank", tracker, link=Link)
        # else:
        #     return[FollowupAction(name='action_get_tour_by_typo')]
        return []


class ActionGetTour(Action):

    def name(self) -> Text:
        return "action_get_tour_by_typo"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        entities = tracker.latest_message['entities']
        # print(entities[0]['value'])
        # text = tracker.latest_message['text']
        if not entities:
            dispatcher.utter_message("Sorry! I do not quite get it")
            return [FollowupAction("action_list_tour")]

        elif entities[0]['entity'] == 'typo':
            text = entities[0]['value']
            cursor.execute(
                "SELECT * from tour where schedule like '%" + text + "%'")

            row = cursor.fetchone()
            if row is None:
                dispatcher.utter_message(
                    text="Sorry, Levart hasn't had "+text+" Tour yet.")
                return[FollowupAction(name='action_list_tour')]
            btn = []
            while row:
                btn.append({"payload": row[3], "title": row[3]})
                row = cursor.fetchone()
            # text = tracker.latest_message['text']
            # print(text)
            # dispatcher.utter_template("utter_thank", tracker, link=Link)
            dispatcher.utter_message(
                text="You can check out some tour:", buttons=btn)
        return []
