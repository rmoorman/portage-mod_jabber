NAME = portage-mod_jabber
VERSION = 0.0.3

snapshot: clean
	mkdir /tmp/$(NAME)-$(VERSION)
	cp * /tmp/$(NAME)-$(VERSION)
	cd /tmp && tar --exclude=".svn" --exclude="Makefile" -jcf $(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION)
	mv /tmp/$(NAME)-$(VERSION).tar.bz2 .
	md5sum $(NAME)-$(VERSION).tar.bz2 > $(NAME)-$(VERSION).md5
	sha512sum $(NAME)-$(VERSION).tar.bz2 > $(NAME)-$(VERSION).sha512
	rm -rf /tmp/$(NAME)-$(VERSION)

release: snapshot
	scp $(NAME)-$(VERSION).* milch:websites/usrportage.de/usrportage.de/software.usrportage.de/$(NAME)

clean:
	rm -rf *~ *.tar.bz2 *.sha512 *.md5
