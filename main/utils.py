from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template

from main.models import *
import secrets
from datetime import datetime, timedelta
from xhtml2pdf import pisa

from main.constants import FEE, COUPONS
from .models import Week, Place
import time

import Flight_DBMS

def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None


def createticket(user,passengers,passengerscount,flight1,flight_1date,flight_1class,coupon,countrycode,email,mobile):
    try:
        ddate = datetime(int(flight_1date.split('-')[2]),int(flight_1date.split('-')[1]),int(flight_1date.split('-')[0]))
        flight1ddate = datetime(int(flight_1date.split('-')[2]),int(flight_1date.split('-')[1]),int(flight_1date.split('-')[0]),flight1.depart_time.hour,flight1.depart_time.minute)
        flight1adate = (flight1ddate + flight1.duration)
        adate = datetime(flight1adate.year,flight1adate.month,flight1adate.day)
        ffre = 0.0
        if flight_1class.lower() == 'first':
            basefare = flight1.first_fare*int(passengerscount)
        elif flight_1class.lower() == 'business':
            basefare = flight1.business_fare*int(passengerscount)
        else:
            basefare = flight1.economy_fare*int(passengerscount)
        finalfare = basefare+FEE

        c_check = False
        if coupon:
            coupon = str(coupon).upper()
            if coupon in COUPONS:
                c_check = True

        if c_check:
            print(finalfare)
            discount = (float(COUPONS[coupon])/100) * basefare
            print(discount)
            finalfare = finalfare - discount
            print(finalfare)
            ticket = Ticket.objects.create(user=user, ref_no=secrets.token_hex(3).upper(), flight=flight1, flight_ddate=ddate, flight_adate=adate, flight_fare=basefare, other_charges=FEE, total_fare=finalfare, coupon_used=coupon, coupon_discount=discount, seat_class=flight_1class.lower(), status='PENDING', mobile=('+'+countrycode+' '+mobile), email=email)
        else:
            ticket = Ticket.objects.create(user=user, ref_no=secrets.token_hex(3).upper(), flight=flight1, flight_ddate=ddate, flight_adate=adate, flight_fare=basefare, other_charges=FEE, total_fare=finalfare, seat_class=flight_1class.lower(), status='PENDING', mobile=('+'+countrycode+' '+mobile), email=email)
        
        for passenger in passengers:
            ticket.passengers.add(passenger)

        return ticket
    except Exception as e:
        raise e

def createWeekDays():
    days = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']
    for i,day in enumerate(days):
        Week.objects.create(number=i, name=day)

def addPlaces():
    file = open("./Data/places.csv", "r")
    for i,line in enumerate(file):
        data = line.split(',')
        city = data[0].strip()
        airport = data[1].strip()
        code = data[2].strip()
        country = data[3].strip()
        try:
            Place.objects.create(city=city, airport=airport, code=code, country=country)
        except Exception as e:
            continue