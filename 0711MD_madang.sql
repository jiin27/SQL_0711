/* ���� ���� ���� 3��° */
/* Q2. �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
    �� �� �� �̻� ������ ������ ���� �̸�
*/
SELECT name FROM Customer c1
    WHERE 2 >=
        (SELECT COUNT(DISTINCT publisher) FROM Customer, Orders, Book
            WHERE Customer.custid=Orders.custid
            AND Orders.bookid=Book.bookid AND (name LIKE c1.name));
            /*  �����: �迬��, �߽ż�, �ڼ��� �� ����. */