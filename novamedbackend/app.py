from flask import Flask, jsonify, request
import pickle
import pymongo
from pymongo.common import SERVER_SELECTION_TIMEOUT

app = Flask(__name__)
dt = pickle.load(open('dt.pkl','rb'))
rf = pickle.load(open('rf.pkl','rb'))
nb = pickle.load(open('nb.pkl','rb'))

##############################################

symptoms=['back_pain','constipation','abdominal_pain','diarrhoea','mild_fever','yellow_urine',
'yellowing_of_eyes','acute_liver_failure','fluid_overload','swelling_of_stomach',
'swelled_lymph_nodes','malaise','blurred_and_distorted_vision','phlegm','throat_irritation',
'redness_of_eyes','sinus_pressure','runny_nose','congestion','chest_pain','weakness_in_limbs',
'fast_heart_rate','pain_during_bowel_movements','pain_in_anal_region','bloody_stool',
'irritation_in_anus','neck_pain','dizziness','cramps','bruising','obesity','swollen_legs',
'swollen_blood_vessels','puffy_face_and_eyes','enlarged_thyroid','brittle_nails',
'swollen_extremeties','excessive_hunger','extra_marital_contacts','drying_and_tingling_lips',
'slurred_speech','knee_pain','hip_joint_pain','muscle_weakness','stiff_neck','swelling_joints',
'movement_stiffness','spinning_movements','loss_of_balance','unsteadiness',
'weakness_of_one_body_side','loss_of_smell','bladder_discomfort','foul_smell_of urine',
'continuous_feel_of_urine','passage_of_gases','internal_itching','toxic_look_(typhos)',
'depression','irritability','muscle_pain','altered_sensorium','red_spots_over_body','belly_pain',
'abnormal_menstruation','dischromic _patches','watering_from_eyes','increased_appetite','polyuria','family_history','mucoid_sputum',
'rusty_sputum','lack_of_concentration','visual_disturbances','receiving_blood_transfusion',
'receiving_unsterile_injections','coma','stomach_bleeding','distention_of_abdomen',
'history_of_alcohol_consumption','fluid_overload','blood_in_sputum','prominent_veins_on_calf',
'palpitations','painful_walking','pus_filled_pimples','blackheads','scurring','skin_peeling',
'silver_like_dusting','small_dents_in_nails','inflammatory_nails','blister','red_sore_around_nose','loss_of_taste',
'yellow_crust_ooze']

symptoms1=[]
for x in range(0,len(symptoms)):
    symptoms1.append(0)

disease=['Fungal infection','Allergy','GERD','Chronic cholestasis','Drug Reaction',
'Peptic ulcer diseae','AIDS','Diabetes','Gastroenteritis','Bronchial Asthma','Hypertension',
' Migraine','Cervical spondylosis',
'Paralysis (brain hemorrhage)','Jaundice','Malaria','Chicken pox','Dengue','Typhoid','hepatitis A',
'Hepatitis B','Hepatitis C','Hepatitis D','Hepatitis E','Alcoholic hepatitis','Tuberculosis',
'Common Cold','Pneumonia','Dimorphic hemmorhoids(piles)',
'Heartattack','Varicoseveins','Hypothyroidism','Hyperthyroidism','Hypoglycemia','Osteoarthristis',
'Arthritis','(vertigo) Paroymsal  Positional Vertigo','Acne','Urinary tract infection','Psoriasis',
'Impetigo','Covid-19']

specialist={'Fungal infection': 'Dermatologist','Allergy': 'Allergist','GERD': 'Gastroenterologist','Chronic cholestasis': 'Hepatologist/Gastroenterologist','Drug Reaction': 'Allergist',
'Peptic ulcer diseae': 'Hepatologist/Gastroenterologist','AIDS': 'HIV/AIDS speciality','Diabetes': 'Diabetologists','Gastroenteritis': 'Gastroenterologist','Bronchial Asthma': 'Allergist/Pulmonologist','Hypertension': 'Cardiologist',
' Migraine': 'Neurologist','Cervical spondylosis': 'Orthopedist/Neurologist',
'Paralysis (brain hemorrhage)': 'Vascular neurologists','Jaundice': 'Gastroenterologist','Malaria': 'Physician','Chicken pox': 'Physician','Dengue': 'Infectiologist','Typhoid': 'Infectiologist','hepatitis A': 'Gastroenterologists/Hepatologist',
'Hepatitis B': 'Gastroenterologists/Hepatologist ','Hepatitis C': 'Gastroenterologists/Hepatologist','Hepatitis D': 'Gastroenterologists/Hepatologist','Hepatitis E': 'Gastroenterologists/Hepatologist','Alcoholic hepatitis': 'Gastroenterologists/Hepatologist','Tuberculosis': 'Pulmonologist',
'Common Cold': 'Paediatrician','Pneumonia': 'Pulmonologist','Dimorphic hemmorhoids(piles)': 'Gastroenterologist',
'Heartattack': 'Cardiologist','Varicoseveins': 'Phlebologist','Hypothyroidism': 'Endocrinologist','Hyperthyroidism': 'Endocrinologist','Hypoglycemia': 'Endocrinologist','Osteoarthristis': 'Rheumatologist',
'Arthritis': 'Rheumatologist','(vertigo) Paroymsal  Positional Vertigo': 'Neurologist','Acne': 'Dermatologist ','Urinary tract infection': 'Urologists','Psoriasis': 'Dermatologist',
'Impetigo': 'Dermatologists','Covid-19': 'Anesthesiology/Cardiology'}

specialist={'Fungal infection': 'Dermatologist','Allergy': 'Allergist','GERD': 'Gastroenterologist','Chronic cholestasis': 'Hepatologist/Gastroenterologist','Drug Reaction': 'Allergist',
'Peptic ulcer diseae': 'Hepatologist/Gastroenterologist','AIDS': 'HIV/AIDS speciality','Diabetes': 'Diabetologists','Gastroenteritis': 'Gastroenterologist','Bronchial Asthma': 'Allergist/Pulmonologist','Hypertension': 'Cardiologist',
' Migraine': 'Neurologist','Cervical spondylosis': 'Orthopedist/Neurologist',
'Paralysis (brain hemorrhage)': 'Vascular neurologists','Jaundice': 'Gastroenterologist','Malaria': 'Physician','Chicken pox': 'Physician','Dengue': 'Infectiologist','Typhoid': 'Infectiologist','hepatitis A': 'Gastroenterologists/Hepatologist',
'Hepatitis B': 'Gastroenterologists/Hepatologist ','Hepatitis C': 'Gastroenterologists/Hepatologist','Hepatitis D': 'Gastroenterologists/Hepatologist','Hepatitis E': 'Gastroenterologists/Hepatologist','Alcoholic hepatitis': 'Gastroenterologists/Hepatologist','Tuberculosis': 'Pulmonologist',
'Common Cold': 'Paediatrician','Pneumonia': 'Pulmonologist','Dimorphic hemmorhoids(piles)': 'Gastroenterologist',
'Heartattack': 'Cardiologist','Varicoseveins': 'Phlebologist','Hypothyroidism': 'Endocrinologist','Hyperthyroidism': 'Endocrinologist','Hypoglycemia': 'Endocrinologist','Osteoarthristis': 'Rheumatologist',
'Arthritis': 'Rheumatologist','(vertigo) Paroymsal  Positional Vertigo': 'Neurologist','Acne': 'Dermatologist ','Urinary tract infection': 'Urologists','Psoriasis': 'Dermatologist',
'Impetigo': 'Dermatologists','Covid-19': 'Anesthesiology/Cardiology'}
###############################################
try:
    mongo = pymongo.MongoClient(host='localhost', port=27017, serverSelectionTimeoutMS=1000)
    mongo.server_info()

except:
    print('ERROR - Cannot connect to db')
###############################################

@app.route('/predict_disease/dt', methods=['POST'], )
def predict_disease1():
    data = request.get_json(force=True)
    s1=data['sym1']
    s2=data['sym2']
    s3=data['sym3']
    s4=data['sym4']
    s5=data['sym5']

    if(s1=='Symptom' and s2=='Symptom' and s3=='Symptom' and s4=='Symptom' and s5=='Symptom'):
        output1 = "Not found"
        sp1 = "Not found"

        return jsonify(json={'dt':output1, 'sp1':sp1})
    else:
        psymptoms = [s1,s2,s3,s4,s5]

        for k in range(0,len(symptoms)):
            for z in psymptoms:
                if(z==symptoms[k]):
                    symptoms1[k]=1

        inputtest = [symptoms1]
        prediction1 = dt.predict(inputtest)
        predicted=prediction1[0]

        h='no'
        for a in range(0,len(disease)):
            if(predicted == a):
                h='yes'
                break


        if (h=='yes'):
            output1 = disease[a]
            sp1 = specialist.get(disease[a])
        else:
            output1 = "Not found"
            sp1 = "Not found"

        return jsonify(json={'dt':output1, 'sp1':sp1})

#######################################################
@app.route('/predict_disease/rf', methods=['POST'], )
def predict_disease2():
    data = request.get_json(force=True)
    s1=data['sym1']
    s2=data['sym2']
    s3=data['sym3']
    s4=data['sym4']
    s5=data['sym5']
    if(s1=='Symptom' and s2=='Symptom' and s3=='Symptom' and s4=='Symptom' and s5=='Symptom'):
        output2 = "Not found"
        sp2 = "Not found"

        return jsonify(json={'rf':output2, 'sp2':sp2})
    else:
        psymptoms = [s1,s2,s3,s4,s5]

        for k in range(0,len(symptoms)):
            for z in psymptoms:
                if(z==symptoms[k]):
                    symptoms1[k]=1

        inputtest = [symptoms1]
        prediction2 = rf.predict(inputtest)
        predicted=prediction2[0]

        h='no'
        for a in range(0,len(disease)):
            if(predicted == a):
                h='yes'
                break


        if (h=='yes'):
            output2 = disease[a]
            sp2 = specialist.get(disease[a])
        else:
            output2 = "Not found"
            sp2 = "Not found"

        return jsonify(json={'rf':output2, 'sp2':sp2})

#####################################################################

@app.route('/predict_disease/nb', methods=['POST'], )
def predict_disease3():
    data = request.get_json(force=True)
    s1=data['sym1']
    s2=data['sym2']
    s3=data['sym3']
    s4=data['sym4']
    s5=data['sym5']
    if(s1=='Symptom' and s2=='Symptom' and s3=='Symptom' and s4=='Symptom' and s5=='Symptom'):
        output3 = "Not found"
        sp3 = "Not found"

        return jsonify(json={'nb':output3, 'sp3':sp3})
    else:
        psymptoms = [s1,s2,s3,s4,s5]

        for k in range(0,len(symptoms)):
            for z in psymptoms:
                if(z==symptoms[k]):
                    symptoms1[k]=1

        inputtest = [symptoms1]
        prediction3 = nb.predict(inputtest)
        predicted=prediction3[0]

        h='no'
        for a in range(0,len(disease)):
            if(predicted == a):
                h='yes'
                break


        if (h=='yes'):
            output3 = disease[a]
            sp3 = specialist.get(disease[a])
        else:
            output3 = "Not found"
            sp3 = "Not found"

        return jsonify(json={'nb':output3, 'sp3':sp3})

if __name__ == '__main__':
    app.run(debug=True, port=5000)