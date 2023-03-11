-------------------------------------------------------------------------------------------------------------------------------------------------------------
Why is MongoDB a NoSQL Database? Check all answers that apply
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. Because it uses a structured way to store and access data
    B. Because it does not utilizie tables, rows and columns to organize data

    Answer: Both

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is a Document?
In MongoDB how does a document relate to a collection?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. Collections are tables of documents and other collecitons.
    B. Collections consist of one or many documents.
    C. Documents are made up of collections.
    D. Collections are documents that are organized in rows and columns.

    Answer: B
    Note: A way to organize and store data as a set of field-value pairs

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is a Collection?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    An organized store of documents in MongoDB, usually with common fields between documents

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the MongoDB Database?
Select the statements that together help build the most complete definition of the MongoDB database:
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. The MongoDB databse is an organized way to store and access data.
    B. MongoDB Database organizes documents in rows and columns.
    C. MongoDB's Database uses tables of related data
    D. MongoDB is a NoSQL Databases that uses documents to store data in an organiced way.

    Answer: A and D

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is a Document?
In a MongoDB Document what is the role of fields and values?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. Values do not have to be attached to fields, and can be stand alone data points.
    B. Each Field has a value associated with it.
    C. A field is a unique identified for a specific datapoint.

    Answer: B and C

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is Atlas?
How is MongoDB Atlas related to MongoDB the database?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. They both are MongoDB products
    B. Atlas is a MongoDB service that can work with any Database, but in this course it will used with MongoDB
    C. MongoDB Database has the same functionality as Atlast, but without the friendly user interface.
    D. Atlas has many tools and services within it that are built specifically for the MongoDB Database.

    Answer: A and D

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What are Pros and Cons of JSON
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    Pros: Friendly, Readable and Familiar
    Cons: 
    a. Text-based : JSON is a text-based format, and text parsing is very slow
    b. Space-Consuming: JSON’s readable format is far from space-efficient, another database concern
    c. JSON only supports a limited number of basic data types

    Alternative solution to this as identified by MongoDB was using BSON (Binary JSON)

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is BSON?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    BSON stands for Binary JSON
    BSON's binary structure encodes type and length information, which allows it to be parsed much more quickly

    BSON is optimized for : Speed, Space and Datatype Flexibility, Readability for Machine only
    And provides High performance and General Purpose focus

    Schema Flexibility and Data Governance:
    One of the big attractions for developers using databases with JSON and BSON data models is the dynamic and flexible schema they provide when 
    compared to the rigid, tabular data models used by relational databases.

    Firstly, JSON documents are polymorphic – fields can vary from document to document within a single collection (analogous to table in a 
    relational database). Documents make modeling diverse record attributes easy for developers, elegantly handling data of any structure.

    Secondly, there is no need to declare the structure of documents to the database – documents are self-describing. Developers can start 
    writing code and persist objects as they are created.

    Thirdly, if a new field needs to be added to a document, it can be created without affecting all other documents in the collection, without 
    updating a central system catalog and without taking the database offline. When you need to make changes to the data model, the document database 
    continues to store the updated objects without the need to perform costly ALTER TABLE operations – or worse, having to redesign the schema from 
    scratch. 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is JSON: Which of the following documents is correct JSON?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. ["name": "Devi", "age": 19, "major": "Computer Science"]
    B. {"name": "Devi", "age": 19, "major": "Computer Science"}
    C. {name: "Devi", age: 19, major: "Computer Science"}

    Answer: B
    JSON rules:
    a. keys must have quotes
    b. Key-Value pairs must be separated by comas
    c. Must start and end with curly-brackets

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Write BSON or JSON in the numbered blanks in the following scentences to make them true:
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    a. MongoDB stortes data in --BSON, and you can then view it in --JSON
    b. --BSON is faster to parse and lighter to store than --JSON
    c. --JSON supports fewer data types than --BSON

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to import data in JSON format?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. mongoimport
    B. mongorestore

    Answer: A. mongoimport

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to export data in JSON format?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. mongoexport
    B. mongodump

    Answer: mongoexport

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to import data in BSON format?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. mongorestore
    B. mongoimport

    Answer: mongorestore

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to export data in BSON format?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. mongodump
    B. mongoexport

    Answer: mongodump

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Which of the following commands will add a collection that is stored in animals.json to and Atlas cluster ?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. mongorestore
    B. mongodump
    C. mongoimport
    D. mongoexport

    Answer: C. mongoimport

Note: The key to identify the correct answer between mongorestore and mongoimport is the file extension, if the file extension is "json" then the 
answer is mongoimport if it would have been 'animals.bson' then answer would have been mongorestore.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is a namespace in MongoDB Data explorer?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    Answer: Its the concatenation of the database name and collection name
    For e.g.: sample_airbnb.listingsAndReviews
    Here: Database is - sample_airbnb and Collection is - listingsAndReviews

-------------------------------------------------------------------------------------------------------------------------------------------------------------
In the sample_training.trips collection a person with birth year 1961 took a trip that started at "Howard St & Centre St". What was the 
end station name for that trip?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    Json Query in Data-Explorer : Collections tab
    {"birth year": 1961, "start station name": "Howard St & Centre St"}

    Note: This question evaluates an 'and' condition in SQL

    Answer: "South End Ave & Liberty St"

-------------------------------------------------------------------------------------------------------------------------------------------------------------
How many documents are returned by a find query as the default value?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. 1
    B. 10
    C. 20
    D. ALL

    Answer: C. 20 : The default configuration in MongoDB is to return only 20 documents for a given criteria
    This value is defined in "DBQuery.shellBatchSize"

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to use in mongoshell, if you want to view the next set of documents returned by a find command after the initial 20 has 
been displayed?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. next
    B. more
    C. IT
    D. it

    Answer: D. it
    it - Is used to iterate through the cursor. 
    (cursor is an object which the find command has returned)
    Formally a cursor is pointer to the result set of a query.A pointer is a direct address to the memory location

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to get the number of returned results?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. more
    B. count
    C. count()

    Answer: C. count()
    Syntax: db.zips.find({"state":"NY", "city":"ALBANY"}).count() 
    Result: 7

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What happens if you run a find command on a collection without any criteria?
db.zips.find({})
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. It returns first 20 rows from the collection
    B. It fails
    C. It returns randomly selected 20 rows from the collection
    D. It returns top 20 rows in ascending order of 'objectID'

    Answer: A. It returns first 20 rows from the collection

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Find Command: What does "it" do in the mongo shell?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. It is not a mongo shell command
    B. Iterates through the cursor results
    C. Warns about imminent termination
    D. Interferes with the task

    Answer: B. Iterates through the cursor results

-------------------------------------------------------------------------------------------------------------------------------------------------------------
The mongo shell: Which of the following statements are true about the mongo shell?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. Mongo shell automatically returns an ordered list of results
    B. Its a fully functioning JavaScript interpreter
    C. It allows you to interact with your MongoDB instance without using a Graphical User Interface

    Answer: B and C

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is common field in every document?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. _id
    B. _rowid
    C. docid
    D. id

    Answer: A. _id
    Note: _id: Must have a unique value to differentiate between documents in a collection. 
    a.  It is an unique identifier
    b.  You can have duplicate keys and values across different documents but value of _id can never be duplicated
    c.  The value of _id is populated by MongoDB
    d.  The type of _id is objectId(), It doesn't have to have the value of type 'objectId' its something that is 
        created by default to ensure unique values for the document.
    e.  If your dataset have unique values that can be used for identification, those can be very well used as values for '_id'

-------------------------------------------------------------------------------------------------------------------------------------------------------------
ObjectId: How does the value of _id get assigned to a document?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. It is automatically generated as an ObjectId type value
    B. When a document is inserted a random field is picked to serve as the _id field
    C. _id field values are sequential integer values
    D. You can select a non ObjectId type value when inserting a new document, as long as that value is unique to this collection

    Answer: A and D

-------------------------------------------------------------------------------------------------------------------------------------------------------------
In a scenario of mongoimport what does E11000 duplicate key error collection mean?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. The JSON file being imported has different encoding
    B. The data in JSON file already exists in the collection
    C. The JSON file is corrupted
    D. The key defined in the mongoimport command is incorrect

    Answer: B. The data in JSON file already exists in the collection
    The insertion failed since the collection already has the document with same _id value we are trying to insert

    A good way to handle this key error is to add the --drop directive in the mongoimport command. That way the collection is first dropped and 
    then the values are inserted.

    syntax: M001 mongoimport --uri="mongodb+srv://m001-student:m001-mongodb-basics@sandbox.delta.mongodb.net/sample_supplies" --drop sales.json

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What is the command to get a general idea of the shape of documents in a collection?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. findOne()
    B. sampleOne()
    C. sample()
    D. findOne

    Answer: A. findOne()

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Insert Errors: Select all true statements from the following list:
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. MongoDB can store duplicate documents in the same colleciton, as long as their _id values are different
    B. MongoDB can always store duplicate documents in the same collections regardless of the _id value
    C. If a document is inserted without a provided _id value, then that document will fail to be inserted and cause a write error
    D. Their is no way to ensure that duplicate records are not stored in MongoDB
    E. If a document is inserted without a provided _id value, then the _id field and value will be automatically generated for the inserted document 
    before insertion

    Answer: A, E

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What will be the behaviour of the following insert command?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
db.inspections.insert([{"_id":1, "test":1}, {"_id":1, "test":2}, {"_id":3, "test":3}])
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. All three documents are inserted in the inspections collection
    B. The insert command fails and none of the documents are inserted in the inspections collection
    C. The insert command partially fails for document with "_id":1, but successfully inserts document with "_id":3
    D. The document with only {"_id":1, "test":1} is inserted successfully, and fails for {"_id":1, "test":2}

    Answer: D. The document with only {"_id":1, "test":1} is inserted successfully, and fails for {"_id":1, "test":2}

Explanation: The default behaviour of insert command is :- To insert the documents in the same order they are list in the array Hence, the first document {"_id":1, "test":1} gets inserted successfully, but {"_id":1, "test":2} fails with E11000 Duplicate key error collection and since the insert failed for the 2nd document, the command execution stops and insertion of {"_id":3, "test":3} is not attempted.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
What will be the behaviour of the following insert command?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
db.inspections.insert([{"_id":1, "test":1}, {"_id":1, "test":2}, {"_id":3, "test":3}], {"ordered": fasle})
-------------------------------------------------------------------------------------------------------------------------------------------------------------

    A. The document with only {"_id":1, "test":1} is inserted successfully, and fails for {"_id":1, "test":2}
    B. The insert command succeeds for {"_id":1, "test":1} and {"_id":3, "test":3} but fails for {"_id":1, "test":2}
    C. The insert command succeeds for {"_id":1, "test":2} and {"_id":3, "test":3} but fails for {"_id":1, "test":1}

    Answer: B. The insert command succeeds for {"_id":1, "test":1} and {"_id":3, "test":3} but fails for {"_id":1, "test":2}
    Note: In case of an 'unordered' or {"ordered": fasle} insert, every document with a unique '_id' gets inserted to the collection.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Assuming the above commands have been executed successfully, what will be behavior of the following command?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
db.inspection.insert([{"_id": 1, "test": 1}, {"_id": 3, "test":3}])
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. Execution will fail with duplicate key error
    B. Execution will succeed without any errors

    Answer: B. Execution will succeed without any errors

Note: Their is a typo in the collections name, its 'inspection' instead of 'inspections' This insert command will create the collection (if it doesn't exist already) 'inspection' and then insert the document in the collection same is valid for databases as well, if it does not exist, 'use dbname' will create it ONLY if their is atleast one collection and that collection has atleast one document in that collection.If you simply execute 'use dbname' and do not create a collection and a document in the collection, 'use dbname' will NOT create a DB.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Insert Order: Which of the following commands will successfully insert 3 new documents into and empty pets collection
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. db.pets.insert([{"pet": "cat"}, {"pet": "dog"}, {"pet": "fish"}])
    B. db.pets.insert([{"_id": 1, "pet": "cat"}, {"_id": 1, "pet": "Dog"}, {"_id": 3, "pet": "fish"}, {"_id": 4, "pet": "snake"}], {"ordered": false})
    C. db.pets.insert([{"_id": 1, "pet": "cat"}, {"_id": 2, "pet": "Dog"}, {"_id": 3, "pet": "fish"}, {"_id": 3, "pet": "snake"}])
    D. db.pets.insert([{"_id": 1, "pet": "cat"}, {"_id": 1, "pet": "Dog"}, {"_id": 3, "pet": "fish"}, {"_id": 4, "pet": "snake"}], {"ordered": True})

    Answer: A, B and C

    Explanation: 
    A. db.pets.insert([{"pet": "cat"}, {"pet": "dog"}, {"pet": "fish"}])
    Will be executed successfully, since the value for _id will be generated by MongoDB automatically making them unique

    B. db.pets.insert([{"_id": 1, "pet": "cat"}, {"_id": 1, "pet": "Dog"}, {"_id": 3, "pet": "fish"}, {"_id": 4, "pet": "snake"}], {"ordered": false})
    Will be executed successfully, since {"ordered": false} will continue execution even after duplicate key errors

    C. db.pets.insert([{"_id": 1, "pet": "cat"}, {"_id": 2, "pet": "Dog"}, {"_id": 3, "pet": "fish"}, {"_id": 4, "pet": "snake"}])
    Will be executed successfully for the top 3 documents, have unique values for _id, while the last one will fail for duplicate key error
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Updating Documents: MongoDB has a flexible data model, which means that you can have fields that contains documents, or arrays as their values
Select any invalid MongoDB documents from the given choices.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. {"_id": 1,
      "pet": "cat",
      "attributes": [{"coat"; "fur", "type": "soft"}, 
              {"defense": "claws", "location": "paws", "nickname": "murder mittens"}],
      "name": "Furball"}

    B. {"_id": 1,
      "pet": "cat",
      "fur": "soft",
      "claws": "sharp",
      "name": "Furball"}

    C. {"_id": 1,
      "pet": "cat",
      "attributes": {"coat": "soft fur", "paws": "cute but deadly"},
      "name": "Furball"}

    D. None of the above

    Answer: D. None of the above

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Update all the documents in the zips collection to increment the population by 10 for HUDSON city
Here's the sample structure of the document
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    { _id: ObjectId("5c8eccc1caa187d17ca75e22"),
      city: 'HUDSON',
      zip: '54016',
      loc: { y: 44.984187, x: 92.727062 },
      pop: 16136,
      state: 'WI' }


    Answer: db.zips.updateMany({"city": "HUDSON"}, {"$inc": {"pop": 10}})

    Explanation: 
    Function: updateMany() : is used to update more than one document in the collection
    Operator: "$inc" : is the increment operator in MongoDB

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Update the population of HUDSON city with zip code 54016 to 17630
Here's the original document for the criteria
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    { _id: ObjectId("5c8eccc1caa187d17ca75e22"),
      city: 'HUDSON',
      zip: '54016',
      loc: { y: 44.984187, x: 92.727062 },
      pop: 16136,
      state: 'WI' }


    Answer: db.zips.updateOne({"city": "HUDSON", "zip": "54106"}, {"$set": {"pop": 17630}})

Explanation: 
Function: updateOne() : is used to update a single document in the collection
Operator: "$set" : is used to set an explicit value of a key in the document

Note: If the key mentioned in the set operator does not exist in the document, then it will add that key with the provided value to the document
This behavior is similar to what happens in the insert function for a non-existing key

Additional Info: If you need to add a key to a nested array of documents, then use "$push" instead of "set"

for e.g.:
sample document from grades collection:

-------------------------------------------------------------------------------------------------------------------------------------------------------------
    { _id: ObjectId("56d5f7eb604eb380b0d8d8dc"),
      student_id: 1,
      scores: 
      [ { type: 'exam', score: 21.311594783977426 },
        { type: 'quiz', score: 58.11840994732081 },
        { type: 'homework', score: 83.99635123409774 },
        { type: 'homework', score: 90.06771379981804 } ],
      class_id: 265 }


    db.grades.updateOne({ "student_id": 250, "class_id": 339 },
                        { "$push": { "scores": { "type": "extra credit",
                                                "score": 100 }
                                    }
                        })

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Updating documents in the shell: Given a pets collection where each document has the following structure and fields:
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    {
    "_id": ObjectId("5ec414e5e722bb1f65a25451"),
    "pet": "wolf",
    "domestic?": false,
    "diet": "carnivorous",
    "climate": ["polar", "equatorial", "continental", "mountain"]
    }

Which of the following commands will add new fields to the updated documents ?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. db.pets.updateMany({"pet": "cat"}, {"$set": {"domestic ?": true, "diet": "mice"}})
    B. db.pets.updateMany({"pet": "cat"}, {"$push": {"climate": "continental", "look": "adorable"}})
    C. db.pets.updateMany({"pet": "cat"}, {"$set": {"climate": "continental"}})
    D. db.pets.updateMany({"pet": "cat"}, {"$set": {"type": "dangerous", "look": "adorable"}})

    Answer: The focus of this question is on "adding new fields", the only two new fields that do not exist in the structure already are
    "look" and "type", hence the answer is B and D.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Given the following structure of a document in the zips collection?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    { _id: ObjectId("5c8eccc1caa187d17ca75e22"),
      city: 'HUDSON',
      zip: '54016',
      loc: { y: 44.984187, x: 92.727062 },
      pop: 16156,
      state: 'WI',
      'city class': 'A'}

How would you delete a field from the document

    A. $remove
    B. $unset
    C. $delete

    Answer: B. $unset

    Explanation: Following would be the command: 

    db.zips.updateOne({"city": "HUDSON", "zip": "54016"}, {"$unset": {"city class": ""}})

    { acknowledged: true,
      insertedId: null,
      matchedCount: 1,
      modifiedCount: 1,
      upsertedCount: 0 }

    db.zips.find({"city": "HUDSON", "zip": "54016"}).pretty()

    { _id: ObjectId("5c8eccc1caa187d17ca75e22"),
      city: 'HUDSON',
      zip: '54016',
      loc: { y: 44.984187, x: 92.727062 },
      pop: 16156,
      state: 'WI' }

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Deleting Documents: The sample dataset contains a few databases that we will not use in this couse. Clean up your Atlas cluster and get rid 
of all the collections in these database:
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    sample_analytics
    sample_geospatial
    sample_weatherdata

    Does removing all collections in a database also remove the database?

    A. Yes
    B. No

    Answer: A. Yes
    Note: MongoDB Database cannot be empty. It must have atleast one collection and the collection must have atleast one document

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Deleting Documents: Which of the following commands will delete a collection name villians?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. db.villians.dropAll()
    B. db.villians.drop()
    C. db.villians.delete()

    Answer: B. db.villians.drop()

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Given the following structure in the trips collection
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    {_id:572bb8222b288919b68ac2d4
    tripduration: 61
    start station id: 3150
    start station name :"E 85 St & York Ave"
    end station id: 3150
    end station name: "E 85 St & York Ave"
    bikeid: 22299
    usertype: "Subscriber"
    birth year: 1989
    gender: 1}

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Which of the following commands will provide results where the trip duration was less than or equal to 70?
-------------------------------------------------------------------------------------------------------------------------------------------------------------
    A. db.trips.find({"tripduration": {"$lte": 70}})
    B. db.trips.find({"tripduration": {"$lt": 70}})
    C. db.trips.find({"tripduration": ["$lte": 70]})
    D. db.trips.find({"tripduration": ("$lt": 70)})

    Answer: A. db.trips.find({"tripduration": {"$lte": 70}})

-------------------------------------------------------------------------------------------------------------------------------------------------------------