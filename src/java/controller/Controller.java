package controller;

import entities.Apuesta;
import entities.Jornada;
import entities.Porra;
import entities.PorraPK;
import entities.Usuario;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import util.JPAUtil;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String op = request.getParameter("op");
        Query q = null;
        List jornadas = null;
        Jornada jornada = null;
        Usuario usuario = null;
        EntityTransaction t = null;
        Porra porra = null;
        String msg = "";
        PorraPK porraPK = null;
        
        // Singleton
        EntityManager em = (EntityManager) session.getAttribute("em");
        if (em == null) {
            // Create the EntityManager
            em = JPAUtil.getEntityManagerFactory().createEntityManager();
            session.setAttribute("em", em);
        }

        switch (op) {
            case "inicio": {
                // actuar en consecuencia
                // .........
                // request.setAttribute("Key", objeto);
                q = em.createQuery("SELECT j FROM Jornada j");
                jornadas = q.getResultList();
                session.setAttribute("jornadas", jornadas);

                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
            case "vajornada": {
                // actuar en consecuencia
                String idjornada = request.getParameter("jornada");

                jornada = em.find(Jornada.class, Short.valueOf(idjornada));

                session.setAttribute("jornada", jornada);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
            case "login": {
                // actuar en consecuencia
                String dni = request.getParameter("dni");
                String nombre = request.getParameter("nombre");

                usuario = em.find(Usuario.class, dni);
                if (usuario == null) {
                    usuario = new Usuario(dni);
                    usuario.setNombre(nombre); // Utilizar el método setNombre de la clase Usuario
                    t = em.getTransaction();
                    t.begin();
                    em.persist(usuario);
                    t.commit();
                    msg = "Nuevo adicto al juego o cuenta secundaria?!?!?!?!?";
                } else {
                    msg = " Holi guarruzo otra vez a apostar????";
                }
                session.setAttribute("msg", msg);
                session.setAttribute("usuario", usuario);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
            case "logout": {
                // actuar en consecuencia
                msg = "Adiosiiiii";
                session.setAttribute("msg", msg);
                session.removeAttribute("usuario");
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
            case "apuesta": {
                // actuar en consecuencia
                String goleslocal = request.getParameter("goleslocal");
                String golesvisitante = request.getParameter("golesvisitante");
                String idpartido = request.getParameter("partido");
                usuario = (Usuario) session.getAttribute("usuario");

                porraPK = new PorraPK(usuario.getDni(), Integer.parseInt(idpartido));
                porra = em.find(Porra.class, porraPK);
                if (porra != null) {
                    msg = "Esta apuesta ya la has hecho melon";
                } else {
                    porra = new Porra(porraPK);
                    porra.setGoleslocal(Short.valueOf(goleslocal));
                    porra.setGolesvisitante(Short.valueOf(golesvisitante));
                    t = em.getTransaction();
                    t.begin();
                    em.persist(porra);
                    t.commit();
                    msg = "Apuesta anotada deja de apostar ya....";
                }

                session.setAttribute("msg", msg);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
            case "resumen": {
                // actuar en consecuencia
                String idpartido = request.getParameter("partido");
                String sql = "select p.goleslocal, p.golesvisitante, count(p) "
                        + "from Porra p where p.partido.idpartido=:idpartido "
                        + "group by p.goleslocal, p.golesvisitante";
                q = em.createQuery(sql);
                q.setParameter("idpartido", Short.valueOf(idpartido));
                List<Object[]> resultList = q.getResultList();
                List<Apuesta> apuestas = new ArrayList<>();
                for (Object[] row : resultList) {
                    apuestas.add(new Apuesta((Short) row[0], (Short) row[1], (Long) row[2]));
                }
                session.setAttribute("apuestas", apuestas);

                request.getRequestDispatcher("apuestas.jsp").forward(request, response);
                break;
            }

            default:
                throw new IllegalArgumentException("Unexpected value: " + op);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
