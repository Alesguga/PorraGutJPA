<%-- 
    Document   : home
    Created on : 23-feb-2024, 12:44:33
    Author     : Alejandro
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>PorrasGut</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body>
        <div class="container shadow p-0">


            <header class="bg-primary text-white py-2">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <img src="img/logoliga.png" alt="" class="img-fluid">
                    </div>
                    <c:choose>
                        <c:when test="${usuario==null}">
                            <div class="col-3 me-3 text-end">
                                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modallogin">Login</button>
                            </div>                        
                        </c:when>
                        <c:otherwise>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-9 text-end">
                                        <h2 class="btn btn-success " >Welcome ${usuario.nombre}</h2>
                                    </div>
                                    <div class="col-3 text-start">
                                        <a class="btn btn-danger" href="Controller?op=logout">Logout</a>
                                    </div>
                                </div>
                            </div>                        
                        </c:otherwise>
                    </c:choose>
                </div>
            </header>
            <main>
                <div class="row justify-content-center my-4">
                    <div class="col-md-6">
                        <form action="Controller?op=vajornada" method="post">
                            <div>
                                <select class="form-select form-select-lg" name="jornada" id=""
                                        onchange="this.form.submit()">
                                    <option disabled selected>Seleccione jornada</option>
                                    <c:forEach items="${jornadas}"  var="jornada">
                                        <option value="${jornada.idjornada}">Jornada  ${jornada.idjornada} (${jornada.fechainicio} - ${jornada.fechafin})</option>
                                    </c:forEach>

                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <c:if test="${jornada==null}">
                    <section class="px-5 pb-5">
                        <img src="img/fotoliga.jpg" alt="" class="img-fluid w-100">
                    </section>
                </c:if>
                <section >
                    <c:forEach items="${jornada.partidoList}" var="partido">

                        <div class="row border-secondary border-bottom align-items-center mb-5 mx-5">
                            <c:if test="${usuario != null}">
                                <div class="col text-start">
                                    <button class="btn btn-danger w-100" data-bs-toggle="modal" data-bs-target="#modalresumen" 
                                            data-bs-local="${partido.local.nombre}" data-bs-visitante="${partido.visitante.nombre}" 
                                            data-bs-partido="${partido.idpartido}"><i class="fa fa-info-circle" aria-hidden="true"></i></button>
                                </div>
                            </c:if>
                            <div class="col text-end">
                                <img src="${partido.local.escudo}" alt="" width="100" class="img-fluid">
                            </div>
                            <div class="col text-end">
                                <h3>${partido.local.nombre}</h3>
                            </div>
                            <div class="col text-center">
                                <h2>${partido.goleslocal}-${partido.golesvisitante}</h2>
                            </div>
                            <div class="col text-start">
                                <h3>${partido.visitante.nombre}</h3>
                            </div>
                            <div class="col "><img src="${partido.visitante.escudo}" alt="" width="100" class="img-fluid"></div>
                                <c:if test="${usuario != null}">
                                <div class="col text-end">
                                    <button class="btn btn-danger w-100" data-bs-toggle="modal" data-bs-target="#modalapuesta" 
                                            data-bs-local="${partido.local.nombre}" data-bs-visitante="${partido.visitante.nombre}" 
                                            data-bs-partido="${partido.idpartido}">
                                        Apostar
                                    </button>
                                </div>
                            </c:if>

                        </div>

                    </c:forEach>

                </section>

            </main>
            <footer class="bg-primary text-center">
                <h4 class="text-white py-4">GS2 DAM GUTI</h4>
            </footer>
            <!--TOSTADA-->
            <div class="position-fixed top-50 start-50 translate-middle m-4">
                <div id="tostada" class="toast rounded-pill border-2 border-danger" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="2000">
                    <div class="toast-body bg-light text-danger text-center rounded-pill">
                        <h5>${msg}</h5>
                    </div>
                </div>
            </div>

            <!-- Modal Body -->
            <!-- if you want to close by clicking outside the modal, delete the last endpoint:data-bs-backdrop and data-bs-keyboard -->
            <div class="modal fade" id="modallogin" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
                 role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitleId">
                                Login & Register
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="Controller?op=login" method="post">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="" class="form-label">D.N.I</label>
                                    <input type="text" class="form-control" name="dni" id="" aria-describedby="helpId"
                                           placeholder="" />
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Nombre</label>
                                    <input type="password" class="form-control" name="nombre" id="" placeholder="" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">
                                    Login & Register
                                </button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <!-- Modal Apuesta -->
            <div class="modal fade" id="modalapuesta" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false"
                 role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-md" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitleId">

                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="" method="post">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="" class="form-label">Goles local</label>
                                    <input type="text" class="form-control" name="goleslocal" id="" aria-describedby="helpId"
                                           placeholder="" />
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Goles visitante</label>
                                    <input type="text" class="form-control" name="golesvisitante" id="" placeholder="" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">
                                    Apostar
                                </button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Modal Resumen -->
            <div class="modal fade" id="modalresumen" tabindex="-1"  data-bs-keyboard="false"
                 role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-md" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitleId">
                            </h5>
                        </div>
                        <div class="modal-body">
                            
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Oki</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/js.js"></script>
        <script src="js/js.js" type="text/javascript"></script>
        <c:if test="${msg!=null}">
            <script type="text/javascript">
                                            const tostada = document.getElementById('tostada')
                                            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(tostada)
                                            toastBootstrap.show()
            </script>
            <c:remove var="msg" scope="session" />
        </c:if>

    </body>

</html>
