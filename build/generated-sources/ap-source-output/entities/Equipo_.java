package entities;

import entities.Partido;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2024-02-25T23:30:36")
@StaticMetamodel(Equipo.class)
public class Equipo_ { 

    public static volatile SingularAttribute<Equipo, String> escudo;
    public static volatile ListAttribute<Equipo, Partido> partidoList;
    public static volatile SingularAttribute<Equipo, Integer> idequipo;
    public static volatile ListAttribute<Equipo, Partido> partidoList1;
    public static volatile SingularAttribute<Equipo, String> nombre;

}