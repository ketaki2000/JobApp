
import moment from "moment-timezone";

export default [
    { 
        "id": 1, 
        "name": "Shivani", 
        "date": moment().subtract(2, "days").format("DD MMM YYYY"), 
        "hospitalname": "Nanavati", 
        "price": "500", 
        "signcount": "1"
    },

    { 
        "id": 2, 
        "name": "Ketaki", 
        "date": moment().subtract(2, "days").format("DD MMM YYYY"), 
        "hospitalname": "Nanavati", 
        "price": "500", 
        "signcount": "2"
    },
    { 
        "id": 3, 
        "name": "Pashva", 
        "date": moment().subtract(2, "days").format("DD MMM YYYY"), 
        "hospitalname": "Nanavati", 
        "price": "500", 
        "signcount": "3"
    },
    { 
        "id": 4, 
        "name": "Shreerang", 
        "date": moment().subtract(2, "days").format("DD MMM YYYY"), 
        "hospitalname": "Nanavati", 
        "price": "500", 
        "signcount": "0"
    },
]