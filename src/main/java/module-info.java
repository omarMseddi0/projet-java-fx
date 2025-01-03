module com.example.semesterproject_2022 {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires org.apache.commons.codec;
    requires com.mailjet.api;
    requires org.jetbrains.annotations;

    // For AnimateFX, use its inferred name
    requires AnimateFX;

    opens com.example.semesterProject_2022 to javafx.fxml;
    exports com.example.semesterProject_2022;
    opens model_class to javafx.fxml;
    exports model_class;
}
