package entities;

import entities.Partido;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2024-02-25T23:30:36")
@StaticMetamodel(Jornada.class)
public class Jornada_ { 

    public static volatile SingularAttribute<Jornada, String> fechainicio;
    public static volatile ListAttribute<Jornada, Partido> partidoList;
    public static volatile SingularAttribute<Jornada, String> fechafin;
    public static volatile SingularAttribute<Jornada, Short> idjornada;
    public static volatile SingularAttribute<Jornada, String> nombre;

}