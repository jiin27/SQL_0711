/* 마당 서점 예제 3번째 */
/* Q2. 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
    → 두 권 이상 도서를 구매한 고객의 이름
*/
SELECT name FROM Customer c1
    WHERE 2 >=
        (SELECT COUNT(DISTINCT publisher) FROM Customer, Orders, Book
            WHERE Customer.custid=Orders.custid
            AND Orders.bookid=Book.bookid AND (name LIKE c1.name));
            /*  결과값: 김연아, 추신수, 박세리 → 오류. */