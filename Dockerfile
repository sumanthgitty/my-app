#Use the official python image as a base image 
FROM python:3.9-slim-buster

#set the working directory in the container
WORKDIR /app

#copy the requirements file from host to container working directory
COPY requirements.txt .

#install the required python packages which are defined inside requirements.txt file
RUN pip3 install --no-cache-dir -r requirements.txt

#copy all the appliaction code from host to conatiner working directory
COPY . .

#set the enviroment varaiable for the flask app
ENV FLASK_RUN_HOST=0.0.0.0

#expose the port on which the flask app will run 
EXPOSE 5000

#start the flask app when the container is run 
CMD [ "flask", "run" ]