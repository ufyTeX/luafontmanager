struct fontinfo {
  char *name;
  char *path;
};

extern int get_installed_fonts_impl(struct fontinfo **const fonts, unsigned int *const count);

