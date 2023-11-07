<!DOCTYPE HTML>
<HTML>
<head>
    <title>Database Query Page</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            display: none; /* Initially hide the result table */
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Database Query Page</h1>
    <!-- Form for entering the SQL query -->
    <form action="" method="post">
        <label for="query">Enter a SQL Query:</label><br>
        <textarea name="query" rows="5" cols="40"></textarea><br>
        <input type="submit" name="execute" value="Execute Query">
    </form>

    <?php
    if (isset($_POST['execute'])) {
        $servername = "localhost";
        $port_no = 3306;
        $username = "wankhede";
        $password = "iitg123";
        $myDB = "mydb"; // Name of the database to access

        try {
            $conn = new PDO("mysql:host=$servername;port=$port_no;dbname=$myDB", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $sql = $_POST['query'];
            $stmt = $conn->query($sql);

            if ($stmt !== false) {
                echo "<h2>Query Result:</h2>";
                echo "<table border='1'><tr>";
                for ($i = 0; $i < $stmt->columnCount(); $i++) {
                    $column = $stmt->getColumnMeta($i);
                    echo "<th>" . $column['name'] . "</th>";
                }
                echo "</tr>";

                while ($row = $stmt->fetch()) {
                    echo "<tr>";
                    foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                    }
                    echo "</tr>";
                }
                echo "</table>";
                echo "<script>document.querySelector('table').style.display = 'block';</script>";
            } else {
                echo "Query executed successfully.";
            }
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }
    ?>
</body>
</HTML>
