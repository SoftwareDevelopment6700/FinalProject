# Explanations

I basically followed the instructions in the website. However, since the instruction is too old, there are plenty of differences while I implemented the application in the IDE. Therefore I think it is necessary to construct a log file to tell you what I did and hopefully can give you some instructions.

## 4. Designing the Data Model

In this section I built the data model following the tutorial. But since we are using our own local database, each of us should create and modify the database on your computer. To do this:

1. First try to run to project to make sure that it works on your computer. You should see a home page that looks like the one in the tutorial.
2. Check _3. Setting up the Development Environment_ - _Communicating with the Database Server_ for instructions to connect the project to your local database.
3. After doing this, there are two ways to build the database:
   - I put an rpideviceshop.sql file under the "SQL" folder. You can check _Forward-Engineering to the Database_ in the tutorial section 4 to see how to do a forward engineering.
   - Or, you can execute the .sql file directly in your MySQL command line.

## 5. Preparing the Page Views and Controller Servlet

### Creating a Header and Footer & Adding a Directive to the Deployment Descriptor

In this section the tutorial created two JSP fragments: a header and a footer because all the five pages share the same header and footer. However, the latest version IDE is different from that in the instruction and therefore I failed configured the web.xml file. Not a big problem I think but just let you know.

### Creating and Implementing the Controller Servlet

After creating and setting up the Controller Servlet, the ControllerServlet.java file exists many errors and I don't know how to fix them. Probably for this reason, the cart, category, checkout and confirmation pages can't be opened directly from the browser. (Notice that these four pages cannot be opened from browser because they are under the WEB-INF folder. However according to the tutorial, it should be able to open after configuring the ControllerServlet.java file)

If we can't fix this problem, we may just simply move these four files(cart, category, checkout and confirmation jsp files) out of the WEB-INF folder. Please check the tutorial for the reason why these four files are put under the WEB-INF folder.

Actually I just noticed that the tutorial provides a "project snapshot" in section 6 which all the content in previous sections are built in this snapshot. We can even try to use this "snapshot" and change the name.

## 6. Connecting the Application to the Database

I inserted four categories namely 'computers', 'tablets', 'phones' and 'games'. Also I inserted a product for each of the categories. Check the category_sample.sql and product_sample.sql under the SQL folder for codes.

### Creating a Connection Pool and Data Source

This is where I stopped because after creating the glassfish-resources.xml file and deploy the project, the jdbc/rpideviceshop resources and the connection pool didn't appear as said in the tutorial. I googled and tried several other ways, but none of them worked. I feel like it doesn't make sense for me to continue doing the following procedures if I can't build this connection. So could you please check the tutorial and see if it works on your computer? Thanks!

JNDI Name: jdbc/rpideviceshop

JBDC Connection Pool Name: RPIDeviceShopPool