import 'package:desafio/models/ticket.dart';


final ticketsList = <Ticket>[
  Ticket(
      id: "HRXAR-1",
      owner: "Igor Costa",
      emailOwner: "Igorcosta.@live.com",
      batch:  "Meia entrada",
      isHalf: false,
      isUsed: false,
    ),
    Ticket(
      id: "BAHSB-5",
      owner: "Kaio Costa",
      emailOwner: "Kaiocosta.@hotmail.com.com",
      batch:  "Meia entrada",
      isHalf: false,
      isUsed: false,
    ),
    Ticket(
      id: "HAUT0-1",
      owner: "Um nome muito longo para aparecer os três pontinhos no final",
      emailOwner: "Igorcosta.@live.com",
      batch: "Convidados",
      isHalf: true,
      isUsed: false,
    ),
    Ticket(
      id: "ASDUG-5",
      owner: "Higor com H",
      emailOwner: "HigorcomH@hotmail.com",
      batch: "Convidados",
      isHalf: true,
      isUsed: true,
    ),
    Ticket(
      id: "AFSJKN-1",
      owner: "Pedro Guerra",
      emailOwner: "outroemail@ccc.com",
      batch: "Convidados",
      isHalf: false,
      isUsed: true,
    ),
      Ticket(
      id: "AFSJKN-3",
      owner: "Helena ",
      emailOwner: "helena@outlook.com",
      batch: "Ingresso único",
      isHalf: false,
      isUsed: true,
    ),
      Ticket(
      id: "AFSJKN-5",
      owner: "Elma",
      emailOwner: "elmafreire@live.com",
      batch: "Ingresso único",
      isHalf: false,
      isUsed: true,
    ),
      Ticket(
      id: "ABSJKN-1",
      owner: "Outro Ingresso",
      emailOwner: "ingresse@live.com",
      batch: "Ingresso único",
      isHalf: false,
      isUsed: true,
    ),
];