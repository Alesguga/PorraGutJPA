package entities;

import entities.Equipo;
import entities.Jornada;
import entities.Porra;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2024-02-25T23:30:36")
@StaticMetamodel(Partido.class)
public class Partido_ { 

    public static volatile SingularAttribute<Partido, String> fecha;
    public static volatile SingularAttribute<Partido, Short> golesvisitante;
    public static volatile SingularAttribute<Partido, Integer> idpartido;
    public static volatile SingularAttribute<Partido, String> hora;
    public static volatile SingularAttribute<Partido, Short> goleslocal;
    public static volatile SingularAttribute<Partido, Equipo> visitante;
    public static volatile ListAttribute<Partido, Porra> porraList;
    public static volatile SingularAttribute<Partido, Jornada> idjornada;
    public static volatile SingularAttribute<Partido, Equipo> local;

}